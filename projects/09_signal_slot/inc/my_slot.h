#ifndef __MY_SLOT_H__
#define __MY_SLOT_H__

#include <stdio.h>
#include <QObject>

class my_slot : public QObject
{
    // Q_OBJECT
private:
    /* data */
public:
    my_slot() {};
    ~my_slot() {};

public slots:
    void slot_fun(){
        printf("my_slot::slot_fun is called\n");
    }
};

#endif /* __MY_SLOT_H__ */