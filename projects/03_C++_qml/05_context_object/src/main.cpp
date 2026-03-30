#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickStyle>
#include <QQmlContext>
#include "propertywrapper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // QString firstname = "ganyuo";
    // QString lastname = "sugar";
    // engine.rootContext()->setContextProperty("firstname", QVariant::fromValue(firstname));
    // engine.rootContext()->setContextProperty("lastname", QVariant::fromValue(lastname));

    PropertyWrapper wrapper;
    wrapper.setFirstname("ganyuo");
    wrapper.setLastname("sugar");
    engine.rootContext()->setContextObject(&wrapper);

    // 加载QML文件
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    QQuickStyle::setStyle("Fusion"); // 设置控件样式
    engine.loadFromModule("qt_quick", "Main");

    return app.exec();
}
