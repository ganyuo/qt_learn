#ifndef APPWRAPPER_H
#define APPWRAPPER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QQmlApplicationEngine>
#include <QGuiApplication>

class AppWrapper : public QObject
{
    Q_OBJECT
public:
    explicit AppWrapper(QObject *parent = nullptr);
    ~AppWrapper();
    Q_INVOKABLE void fetchPosts();
    Q_INVOKABLE void removeLast();
    bool initialize(QGuiApplication* pApp);
    void resetModel();

private slots:
    void dataReadyRead();
    void dataReadFinished();


signals:

private:
    std::unique_ptr<QNetworkAccessManager> m_pNetManager;
    QNetworkReply* m_pNetReply;
    QByteArray m_dataBuffer;
    QStringList m_posts;
    QQmlApplicationEngine m_engine;
};

#endif // APPWRAPPER_H
