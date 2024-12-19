#include <QApplication>
#include <QMainWindow>
#include <QMenuBar>
#include <QMenu>
#include <QAction>
#include <QObject>
#include <QToolBar>
#include <QStatusBar>
#include <QLabel>
#include <QGridLayout>
#include <QLineEdit>
#include <QSystemTrayIcon>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QMainWindow main_win;
    main_win.resize(600, 400);

    /* 菜单栏 */
    QMenuBar *meun_bar = main_win.menuBar(); /* 获取主窗口的菜单栏 */
    QMenu *file_menu = meun_bar->addMenu("&file"); /* 在菜单栏里添加一个file菜单 */
    QMenu *edit_menu = meun_bar->addMenu("&edit"); /* 再添加一个edit菜单 */
    QAction *open_action = file_menu->addAction("&open"); /* 向file菜单里添加Action */
    QAction *save_action = file_menu->addAction("&save");
    file_menu->addSeparator();  /* 向file菜单里添加分割线 */
    QAction *exit_action = file_menu->addAction("&exit");
    /* 将exit Action的触发信号，连接到主窗口的关闭槽函数，实现点击exit后关闭主窗口 */
    QObject::connect(exit_action, SIGNAL(triggered(bool)), &main_win, SLOT(close()));
    exit_action->setToolTip("close window");

    /* 工具栏 */
    QToolBar *tool_bar = main_win.addToolBar("tool_bar"); /* 向主窗口添加工具栏 */
    tool_bar->addAction(open_action); /* 向工具栏中添加Action */
    tool_bar->addAction(save_action);
    tool_bar->addAction(exit_action);
    tool_bar->setAllowedAreas(Qt::AllToolBarAreas); /* 设置可停靠区域 */
    tool_bar->setFloatable(true); /* 设置是否可以浮动 */

    /* 状态栏 */
    QStatusBar *status_bar = main_win.statusBar();  /* 获取主窗口的状态栏 */
    QLabel *status_label = new QLabel("main window running...");
    status_bar->addWidget(status_label);

    /* 中心区域，别的控件占用了之后，剩下的区域都是CentralWidget */
    QWidget central_widge;
	QGridLayout central_layout;
	central_layout.setRowStretch(0, 1);
	central_layout.setColumnStretch(0, 1);
	central_layout.addWidget(new QLabel("用户名："), 1, 1);
	central_layout.addWidget(new QLineEdit(), 1, 2);
	central_layout.addWidget(new QLabel("密码："), 2, 1);
	central_layout.addWidget(new QLineEdit(), 2, 2);
	central_layout.setRowStretch(3, 1);
	central_layout.setColumnStretch(3, 1);
	central_widge.setLayout(&central_layout);
    main_win.setCentralWidget(&central_widge); /* 设置主窗口的中心区域 */

    main_win.show();

    /* 系统托盘图标 */
    QSystemTrayIcon tray_icon;
    tray_icon.setIcon(QIcon("image/滑稽.png")); /* 设置图标图片 */
    tray_icon.setContextMenu(file_menu);  /* 设置菜单 */
    tray_icon.show();

    app.exec();
    return 0;
}