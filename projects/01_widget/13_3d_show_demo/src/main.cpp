#include <QApplication>
#include <QMainWindow>
#include "i3d_model_widget.hpp"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QMainWindow main_win;
    main_win.resize(600, 400);

    imu_tools::gui::i3d_model_widget_t i3d_widget;
    i3d_widget.load_model("/home/ganyuo/workspace/qt_learn/projects/13_3d_show_demo/module/airplane-icon.obj");

    main_win.setCentralWidget(&i3d_widget); /* 设置主窗口的中心区域 */

    main_win.show();
    app.exec();
    return 0;
}