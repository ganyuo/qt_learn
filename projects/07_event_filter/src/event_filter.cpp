#include "event_filter.h"
#include <QWidget>
#include <QPushButton>
#include <QEvent>
#include <QDebug>

event_filter::event_filter()
{
    _button = new QPushButton("button");
    _button->setParent(this);
    connect(_button, SIGNAL(clicked()), this, SLOT(close()));

    /* button给自己安装了一个消息过滤器
     * 经过button的消息，都会先调用它的过滤器的eventFilter函数 */
    _button->installEventFilter(this);
}

/* 重载消息过滤器 */
bool event_filter::eventFilter(QObject *o, QEvent *e)
{
    if(o == (QObject *)_button &&(
        e->type() == QEvent::MouseButtonPress ||
        e->type() == QEvent::MouseButtonRelease ||
        e->type() == QEvent::MouseButtonDblClick))
    {
        qDebug() << "button mouse event";
        return true;
    }
    return QWidget::eventFilter(o, e);
}

bool event_filter::event(QEvent *e)
{
    if(e->type() == QEvent::User)
    {
        qDebug() << "User event is comming";
    }
    return QWidget::event(e);
}

event_filter::~event_filter()
{
}
