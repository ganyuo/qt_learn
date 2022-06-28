/**
 ************************************
 * @file     : main.cpp
 * @author   : ganyuo
 * @date     : 2021-03-27
 ************************************
 * @brief :
 * 		Qt的layout布局
 */

#include <QApplication>
#include <QWidget>
#include <QPushButton>
#include <QLineEdit>
#include <QLabel>

#include <QVBoxLayout> /* 垂直布局 */
#include <QHBoxLayout> /* 水平布局 */
#include <QGridLayout> /* 格子布局 */

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QWidget widget;
	widget.setWindowTitle("Hello World");

	QPushButton button;
	button.setText("Button");
	button.setParent(&widget);

	QLineEdit line_edit;
	line_edit.setParent(&widget);

#if 0
	// QVBoxLayout layout;
	QHBoxLayout layout;
	layout.addStretch(1); /* 加一个弹簧 */
	layout.addWidget(&button, 1);
	layout.addSpacing(20); /* 中间加一些间隔 */
	layout.addWidget(&line_edit, 1);
	layout.addStretch(1);
	widget.setLayout(&layout);
#endif

#if 0
	QGridLayout layout;
	layout.setRowStretch(0, 1);
	layout.setColumnStretch(0, 1);

	layout.addWidget(&button, 1, 1);
	layout.addWidget(&line_edit, 1, 2, 2, 1);
	layout.addWidget(new QPushButton("1,0"), 2, 1);
	layout.addWidget(new QPushButton("aaa"), 3, 1, 1, 2);

	layout.setRowStretch(4, 1);
	layout.setColumnStretch(3, 1);

	widget.setLayout(&layout);
#endif

#if 1
	QGridLayout layout;
	layout.setRowStretch(0, 1);
	layout.setColumnStretch(0, 1);

	layout.addWidget(new QLabel("用户名："), 1, 1);
	layout.addWidget(new QLineEdit(), 1, 2);
	layout.addWidget(new QLabel("密码："), 2, 1);
	QLineEdit *passwd_edit = new QLineEdit();
	layout.addWidget(passwd_edit, 2, 2);
	passwd_edit->setEchoMode(QLineEdit::Password);

	QHBoxLayout hbox;
	hbox.addStretch(1);
	hbox.addWidget(new QPushButton("登录"));
	layout.addLayout(&hbox, 3, 1, 1, 2);

	layout.setRowStretch(4, 1);
	layout.setColumnStretch(3, 1);

	widget.setLayout(&layout);
#endif

	widget.show();
	return app.exec();
}
