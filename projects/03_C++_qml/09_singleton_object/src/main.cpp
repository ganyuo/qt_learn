#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickStyle>
#include <QQmlContext>
#include "singleton.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Singleton singleton;
    qmlRegisterSingletonInstance("qt_learn", 1, 0, "Singleton", &singleton);

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
