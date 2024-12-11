#ifndef __MY_SIGHNAL_H__
#define __MY_SIGHNAL_H__

#include <QObject>

/* 一个定义了信号的类 */
class my_signal : public QObject
{
    Q_OBJECT

signals:
    /* 信号 */
    void signal_fun();
};

#endif /* __MY_SIGHNAL_H__ */