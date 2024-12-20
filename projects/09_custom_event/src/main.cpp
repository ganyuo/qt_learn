#include <QApplication>
#include <QWidget>
#include <QPushButton>
#include <QEvent>
#include <QDebug>

/* 初始化自定义的事件类型值 */
static const int CUSTOM_EVENT_TYPE = QEvent::registerEventType();

/* 自定义事件类 */
class custom_event_t : public QEvent
{
public:
	custom_event_t() : QEvent((QEvent::Type)CUSTOM_EVENT_TYPE) {};
};

class main_widgt_t : public QWidget
{
public:
    main_widgt_t() : QWidget() {};

    bool event(QEvent *e);
    void customEvent(QEvent *e);
};

/* 重载事件处理函数 */
bool main_widgt_t::event(QEvent *e)
{
    if(e->type() == CUSTOM_EVENT_TYPE)
    {
        qDebug() << "event() get custom event\n";
    }
    return QObject::event(e);
}

/* 重载自定义事件处理函数 */
void main_widgt_t::customEvent(QEvent *e)
{
    if(e->type() == CUSTOM_EVENT_TYPE)
    {
        qDebug() << "customEvent() get custom event\n";
    }
}

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	main_widgt_t main_w;

    qDebug() << "CUSTOM_EVENT_TYPE: " << CUSTOM_EVENT_TYPE;

	QPushButton button("send custom event");
	button.setParent(&main_w);

    /* 使用lambda表达式连接button的点击事件 */
	QObject::connect(&button, &QPushButton::clicked, [&main_w]()
	{
        custom_event_t custom_event;
        /* 给main_w发送自定义事件 */
        QApplication::sendEvent(&main_w, &custom_event);
	});

	main_w.show();
	return app.exec();
}