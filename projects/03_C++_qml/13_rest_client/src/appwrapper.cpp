#include "appwrapper.h"
#include <QQmlContext>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

AppWrapper::AppWrapper(QObject *parent)
    : QObject{parent},
    m_pNetManager(std::make_unique<QNetworkAccessManager>())
{}

AppWrapper::~AppWrapper()
{

}

void AppWrapper::fetchPosts()
{
    // Initialize our API data
    const QUrl API_ENDPOINT("https://jsonplaceholder.typicode.com/posts");
    QNetworkRequest request;
    request.setUrl(API_ENDPOINT);

    m_pNetReply = m_pNetManager->get(request);
    connect(m_pNetReply, &QIODevice::readyRead, this, &AppWrapper::dataReadyRead);
    connect(m_pNetReply, &QNetworkReply::finished, this, &AppWrapper::dataReadFinished);

}

void AppWrapper::removeLast()
{
    if (!m_posts.isEmpty())
    {
        m_posts.removeLast();
        resetModel();
    }
}

bool AppWrapper::initialize(QGuiApplication *pApp)
{
    m_engine.rootContext()->setContextProperty("Wrapper", this);
    resetModel();

    QObject::connect(
        &m_engine,
        &QQmlApplicationEngine::objectCreationFailed,
        pApp,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    m_engine.loadFromModule("qt_quick", "Main");

    if(m_engine.rootObjects().isEmpty())
        return false;

    return true;
}

void AppWrapper::dataReadyRead()
{
    m_dataBuffer.append(m_pNetReply->readAll());
}

void AppWrapper::dataReadFinished()
{
    // Parse the JSON
    if (m_pNetReply->error())
    {
        qDebug()<<"Error: " << m_pNetReply->errorString();
    } else {
        // Turn the data into a json document
        QJsonDocument doc = QJsonDocument::fromJson(m_dataBuffer);
        QJsonArray array = doc.array();
        foreach (QJsonValue value, array) {
            QJsonObject object = value.toObject();
            QVariantMap map = object.toVariantMap();
            QString title = map["title"].toString();
            m_posts.append(title);
        }
        if (array.size()>0)
        {
            resetModel();
        }
        // Clear the buffer
        m_dataBuffer.clear();

    }
}

void AppWrapper::resetModel()
{
    m_engine.rootContext()->setContextProperty("MyModel", QVariant::fromValue(m_posts));
}
