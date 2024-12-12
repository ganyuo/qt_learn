#ifndef __MY_SLOT_H__
#define __MY_SLOT_H__

#include <QObject>
#include <QDebug>

/* 一个定义了槽函数的类 */
class my_slot : public QObject
{
    Q_OBJECT

public slots:
    /* 槽函数 */
    virtual void slot_fun(const char *str){
        qDebug() << "my_slot::slot_fun get str: " << str;
    }
};

#endif /* __MY_SLOT_H__ */