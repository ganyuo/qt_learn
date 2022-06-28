/**
 ************************************
 * @file     : main.cpp
 * @author   : ganyuo
 * @date     : 2021-03-27
 ************************************
 * @brief :
 * 		Qt的坐标系统
 */

#include <QApplication>
#include <QWidget>
#include <QPushButton>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QWidget widget;
	widget.setWindowTitle("Hello World");

	QPushButton button;
	button.setText("Button");
	button.setParent(&widget);

	/* 设置button的相对父窗口的坐标ax,ay，以及button的宽度aw和高度ah */
	button.setGeometry(30, 30, 200, 100);

	widget.show();
	return app.exec();
}
