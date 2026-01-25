#include <QCoreApplication>

#include "my_signal.h"
#include "my_slot.h"

int main(int argc, char *argv[])
{
	QCoreApplication app(argc, argv);

    my_signal sign_1(1), sign_2(2);
    my_slot slot(1);

    /* 两个信息号相连 */
    QObject::connect(&sign_1, SIGNAL(signal_fun(const char *, int)),
                     &sign_2, SIGNAL(signal_fun(const char *, int)));
    /* 两个信号连接到同一个槽上 */
    QObject::connect(&sign_1, SIGNAL(signal_fun(const char *, int)),
                     &slot, SLOT(slot_fun(const char *)));
    QObject::connect(&sign_2, SIGNAL(signal_fun(const char *, int)),
                     &slot, SLOT(slot_fun(const char *)));
    // QObject::disconnect(&sign_2, SIGNAL(signal_fun(const char *, int)),
    //                     &slot, SLOT(slot_fun(const char *)));

    /* 发送信号1，信号2也会发送出去 */
    emit sign_1.signal_fun("hello word 1", 1);

    /* 发送信号2，信号1不会被发送出去 */
    emit sign_2.signal_fun("hello word 2", 1);

	return app.exec();
}
