#include <QApplication>
#include <QWidget>
#include <QPushButton>
#include <QEvent>
#include <QDebug>

class event_filter : public QObject
{
public:
	event_filter() : QObject() {};

	/* 重载消息过滤器 */
	bool eventFilter(QObject *o, QEvent *e);
	bool event(QEvent *e);
};

/* 重载消息过滤器 */
bool event_filter::eventFilter(QObject *o, QEvent *e)
{
    if (e->type() == QEvent::MouseButtonPress ||
        e->type() == QEvent::MouseButtonRelease ||
        e->type() == QEvent::MouseButtonDblClick)
    {
        qDebug() << "button mouse event";
        return true;
    }
    return QObject::eventFilter(o, e);
}

bool event_filter::event(QEvent *e)
{
    if(e->type() == QEvent::User)
    {
        qDebug() << "User event is comming";
    }
    return QObject::event(e);
}

class my_application : public QApplication
{
public:
	/* 这里argc前不加&会段错误 */
	my_application(int &argc, char *argv[]);
	bool notify(QObject *o, QEvent *e);
};

my_application::my_application(int &argc, char *argv[]) : QApplication(argc, argv) {}

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
	QWidget main_w;

	QPushButton button("close");
	button.setParent(&main_w);
	QObject::connect(&button, SIGNAL(clicked()), &main_w, SLOT(close()));

	event_filter e_filter;
	button.installEventFilter(&e_filter);

	main_w.show();

	/* 发送一个Event给widget */
	// app.sendEvent(&e_filter, new QEvent(QEvent::User));  /* 发送消息，需要等widget处理完才运行后面程序 */
	app.postEvent(&e_filter, new QEvent(QEvent::User));  /* 只将消息加入到消息队列，不需要等widget处理完 */

	return app.exec();
}
