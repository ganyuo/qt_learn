#include <QCoreApplication>

#include "my_signal.h"
#include "my_slot.h"

int main(int argc, char *argv[])
{
	QCoreApplication app(argc, argv);

    my_signal sign;
    my_slot slot;

    /* 连接信号和槽, 信号函数的参数个数要大于槽函数 */
    QObject::connect(&sign, SIGNAL(signal_fun(const char *, int)), &slot, SLOT(slot_fun(const char *)));

    /* 发送信号 */
    emit sign.signal_fun("hello word", 1);

	return app.exec();
}
