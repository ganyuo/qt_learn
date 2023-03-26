/**
 ************************************
 * @file     : main.cpp
 * @author   : ganyuo
 * @date     : 2021-03-25
 ************************************
 * @brief :
 * 		LineEdit控件
 */

#include <QApplication> /* 应用程序抽象类 */
#include <QWidget>      /* 窗口类 */
#include <QLineEdit>    /* 输入框 */
#include <QVBoxLayout>
#include <QCompleter>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	QWidget widget; /* 构造一个窗口 */

	/* 添加两个输入框 */
	QLineEdit name_input, password_input;
	QVBoxLayout layout(&widget);
	layout.addWidget(&name_input);
	layout.addWidget(&password_input);

	QCompleter completer(QStringList() << "abc" << "aaa" << "123");
	completer.setFilterMode(Qt::MatchContains);
	name_input.setCompleter(&completer); /* 设置输入匹配提示 */
	name_input.setPlaceholderText("请用户名"); /* 设置输入提示 */

	password_input.setEchoMode(QLineEdit::Password); /* 设置回显模式为密码模式 */
	password_input.setPlaceholderText("请输入密码"); /* 设置输入提示 */

	widget.show(); /* 显示窗口 */
	return app.exec(); /* exec():进入消息循环 */
}
