#ifndef __COUNTER_HPP__
#define __COUNTER_HPP__

#include <QObject>
#include <QTimer>
#include <QtQml>
#include "counting.hpp"

class Counter : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(int count READ count WRITE set_count NOTIFY count_changed)
    Q_PROPERTY(Counting::Count_direction direction READ direction WRITE set_direction NOTIFY direction_changed)

private:
    int _count;
    Counting::Count_direction _direction;
    QTimer *_timer;    

public:
    Counter(QObject * parent = nullptr);
    ~Counter();

    int count();
    void set_count(int count);

    Counting::Count_direction direction();
    void set_direction(Counting::Count_direction direction);

    Q_INVOKABLE void count_start();
    Q_INVOKABLE void count_stop();

signals:
    void count_changed();
    void direction_changed();
};

#endif /* __COUNTER_HPP__ */
