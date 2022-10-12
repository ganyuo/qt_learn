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
#include <QWidget>  /* 窗口类 */
#include <QLineEdit>
#include <QCompleter>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QWidget widget; /* 构造一个窗口 */
	widget.setWindowTitle("Hello World");

	QLineEdit line_edit;
	line_edit.setParent(&widget);

	// line_edit.setEchoMode(QLineEdit::Password); /* 设置回显模式为密码模式 */
	line_edit.setPlaceholderText("请输入密码");
	QString text = line_edit.text();
	QCompleter completer(QStringList() << "abc" << "129" << "998");
	completer.setFilterMode(Qt::MatchContains);
	line_edit.setCompleter(&completer);

	widget.show(); /* 显示窗口 */
	return app.exec(); /* exec():进入消息循环 */
}
