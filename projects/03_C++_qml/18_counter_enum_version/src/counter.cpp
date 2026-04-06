#include "counter.hpp"
#include <QDebug>

Counter::Counter(QObject * parent)
    : QObject(parent),
    _count(0),
    _direction(Counting::Count_direction::UP),
    _timer(new QTimer(this))
{
    qDebug() << "Created counter instance";
    _timer->setInterval(1000);
    QObject::connect(_timer, &QTimer::timeout, [=]{
        if (_direction == Counting::Count_direction::UP)
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

Counting::Count_direction Counter::direction()
{
    return _direction;
}

void Counter::set_direction(Counting::Count_direction direction)
{
    if (_direction != direction)
    {
        _direction = direction;
        emit direction_changed();
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
