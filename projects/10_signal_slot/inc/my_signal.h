#ifndef __MY_SIGHNAL_H__
#define __MY_SIGHNAL_H__

#include <QObject>

/* 一个定义了信号的类 */
class my_signal : public QObject
{
    Q_OBJECT

private:
    int _id = 0;

public:
    my_signal(int id_) : QObject(), _id(id_) {};

    int get_id()
    {
        return _id;
    }

signals:
    /* 信号 */
    void signal_fun(const char *str, int num = 0);
};

#endif /* __MY_SIGHNAL_H__ */