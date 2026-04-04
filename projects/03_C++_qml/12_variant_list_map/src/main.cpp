#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickStyle>
#include <QQmlContext>
#include "cppclass.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Cppclass cpp_class;
    engine.rootContext()->setContextProperty("Cpp_class", &cpp_class);

    // 加载QML文件
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    QQuickStyle::setStyle("Fusion"); // 设置控件样式
    engine.loadFromModule("qt_quick", "Main");

    if (engine.rootObjects().isEmpty())
    {
        return -1;
    }
    else
    {
        cpp_class.set_qml_root_object(engine.rootObjects().first());
    }

    return app.exec();
}
