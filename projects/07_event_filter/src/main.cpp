#include <QApplication>
#include "event_filter.h"
#include <QEvent>
#include <QDebug>

class my_application : public QApplication
{
private:
	/* date */
public:
	my_application(int &argc, char *argv[]); /* 这里argc前不加&会段错误 */
	bool notify(QObject *o, QEvent *e);
};

my_application::my_application(int &argc, char *argv[]) : QApplication(argc, argv)
{
}

bool my_application::notify(QObject *o, QEvent *e)
{
	if(this->topLevelWidgets().length() > 0)
	{
		QWidget *main_widget = this->topLevelWidgets().at(0);
		if(o == (QObject *)main_widget && e->type() == QEvent::MouseButtonPress)
		{
			qDebug() << "mian widget is clicked";
		}
	}
	return QApplication::notify(o, e);
}

int main(int argc, char *argv[])
{
	my_application app(argc, argv);

	event_filter widget;
	widget.show();

	/* 发送一个Event给widget */
	qDebug() << "begin send";
	// app.sendEvent(&widget, new QEvent(QEvent::User));  /* 发送消息，需要等widget处理完才运行后面程序 */
	app.postEvent(&widget, new QEvent(QEvent::User));  /* 只将消息加入到消息队列，不需要等widget处理完 */
	qDebug() << "end send";

	return app.exec();
}
