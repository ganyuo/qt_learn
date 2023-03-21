/**
 ************************************
 * @file     : main.cpp
 * @author   : ganyuo
 * @date     : 2021-03-24
 ************************************
 * @brief :
 * 		用qt写一个hello world
 */

#include <QApplication> /* 应用程序抽象类 */
#include <QWidget>  /* 窗口类 */
#include <QPushButton> /* 按钮类 */

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QWidget widget; /* 构造一个窗口 */
	widget.setWindowTitle("Hello World"); /* 设置窗口标题 */
	widget.show(); /* 显示窗口 */

	/* 按钮也是一个窗口 */
	QPushButton button;
	button.setText("Button");
	/* 窗口对象的父子关系，影响显示位置 */
	button.setParent(&widget);
	// button.show();

	/* Qt对C++的拓展 */
	/* 类似std::bind std::function */
	QObject::connect(&button, SIGNAL(clicked()), &widget, SLOT(close()));

	return app.exec(); /* exec():进入消息循环 */
}
