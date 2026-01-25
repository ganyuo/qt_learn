#ifndef __MY_SLOT_H__
#define __MY_SLOT_H__

#include <QObject>
#include <QDebug>

#include "my_signal.h"

/* 一个定义了槽函数的类 */
class my_slot : public QObject
{
    Q_OBJECT

private:
    int _id = 0;

public:
    my_slot(int id_) : QObject(), _id(id_) {};

    int get_id()
    {
        return _id;
    }

public slots:
    /* 槽函数 */
    virtual void slot_fun(const char *str)
    {
		my_signal *sign = static_cast<my_signal *>(sender());
        qDebug() << "my_slot: " << get_id()
                 << " get my_sign: " << sign->get_id()
                 << " str: " << str;
    }
};

#endif /* __MY_SLOT_H__ */