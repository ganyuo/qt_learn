/**
 * @file main.cpp
 * @brief main函数
 * @author ganyuo (ganyuo@outlook.com)
 * @version 0.1
 * @date 2025-12-24
 * 
 * @copyright Copyright (C), 2019-2099, GaoWeiGanZhi. Co., Ltd.
 * 
 * 更新历史
 * 版本号 | 时间       | 修订者 | 修改内容
 * V0.1   | 2025-12-24 | ganyuo | 创建主窗口
 */

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