#include "counter.hpp"
#include <QDebug>

Counter::Counter(QObject * parent)
    : QObject(parent),
    _count(0),
    _up(true),
    _timer(new QTimer(this))
{
    qDebug() << "Created counter instance";
    _timer->setInterval(1000);
    QObject::connect(_timer, &QTimer::timeout, [=]{
        if (_up)
        {
            ++_count;
        }
        else
        {
            --_count;
        }
        emit count_changed();
    });
}

Counter::~Counter()
{
}

int Counter::count()
{
    return _count;
}

void Counter::set_count(int count)
{
    if (_count != count)
    {
        _count = count;
        emit count_changed();
    }
}

bool Counter::up()
{
    return _up;
}

void Counter::set_up(bool up)
{
    if (_up != up)
    {
        _up = up;
        emit up_changed();
    }
}

Q_INVOKABLE void Counter::count_start()
{
    _timer->start();
}

Q_INVOKABLE void Counter::count_stop()
{
    _timer->stop();
}
