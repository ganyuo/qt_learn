#ifndef __MY_SIGHNAL_H__
#define __MY_SIGHNAL_H__

#include <QObject>

class my_signal : public QObject
{
    // Q_OBJECT
private:
    /* data */
public:
    my_signal() {};
    ~my_signal() {};

signals:
    virtual void signal_fun() {};
};

#endif /* __MY_SIGHNAL_H__ */