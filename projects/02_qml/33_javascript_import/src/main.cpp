#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // 加载QML文件
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("qt_quick", "Main");

    return app.exec();
}
