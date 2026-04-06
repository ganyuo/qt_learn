#ifndef __COUNTER_HPP__
#define __COUNTER_HPP__

#include <QObject>
#include <QTimer>
#include <QtQml>

class Counter : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(int count READ count WRITE set_count NOTIFY count_changed)
    Q_PROPERTY(bool up READ up WRITE set_up NOTIFY up_changed)

private:
    int _count;
    bool _up;
    QTimer *_timer;    

public:
    Counter(QObject * parent = nullptr);
    ~Counter();

    int count();
    void set_count(int count);

    bool up();
    void set_up(bool up);

    Q_INVOKABLE void count_start();
    Q_INVOKABLE void count_stop();

signals:
    void count_changed();
    void up_changed();
};

#endif /* __COUNTER_HPP__ */
