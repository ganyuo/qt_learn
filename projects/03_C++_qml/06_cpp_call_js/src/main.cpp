#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickStyle>
#include <QQmlContext>
#include "qml_js_caller.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qml_js_caller_t caller;
    engine.rootContext()->setContextProperty("qml_js_caller", &caller);

    // 加载QML文件
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    QQuickStyle::setStyle("Fusion"); // 设置控件样式
    engine.loadFromModule("qt_quick", "Main");
    caller.set_qml_root_object(engine.rootObjects()[0]);

    return app.exec();
}
