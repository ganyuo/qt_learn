#ifndef EVENT_FILTER_H
#define EVENT_FILTER_H

#include <QWidget>
#include <QPushButton>

class event_filter : public QWidget
{
	// Q_OBJECT
private:
	/* data */
	QPushButton *_button;
public:
	event_filter();
	~event_filter();

	/* 重载消息过滤器 */
	bool eventFilter(QObject *o, QEvent *e);
	bool event(QEvent *e);
};

#endif /* EVENT_FILTER_H */