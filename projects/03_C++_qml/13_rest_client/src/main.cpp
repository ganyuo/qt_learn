#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickStyle>
#include <QQmlContext>
#include "appwrapper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    AppWrapper app_wrapper;
    app_wrapper.initialize(&app);

    return app.exec();
}
