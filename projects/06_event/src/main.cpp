/**
 ************************************
 * @file     : main.cpp
 * @author   : ganyuo
 * @date     : 2021-04-27
 ************************************
 * @brief :
 * 		Qt的常用控件
 */

#include <QApplication>
#include "my_event.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	my_event widget;
	widget.show();

	return app.exec();
}
