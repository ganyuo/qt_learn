#include <QCoreApplication>

#include "my_signal.h"
#include "my_slot.h"

int main(int argc, char *argv[])
{
	QCoreApplication app(argc, argv);

    my_signal sign;
    my_slot slot;

    /* 连接信号和槽 */
    QObject::connect(&sign, SIGNAL(signal_fun()), &slot, SLOT(slot_fun()));

    /* 发送信号 */
    emit sign.signal_fun();

	return app.exec();
}
