#ifndef __MY_SIGHNAL_H__
#define __MY_SIGHNAL_H__

#include <QObject>
#include <QDebug>

class my_signal : public QObject
{
    // Q_OBJECT
private:
    /* data */
public:
    my_signal() {};
    ~my_signal() {};

    void send_signal(){
        qDebug() << "send_signal";
        emit signal_fun();
    }

signals:
    virtual void signal_fun() {};
};

#endif /* __MY_SIGHNAL_H__ */