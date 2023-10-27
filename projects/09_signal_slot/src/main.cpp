#include <QCoreApplication>
#include <stdio.h>

#include "my_signal.h"
#include "my_slot.h"

int main(int argc, char *argv[])
{
	QCoreApplication app(argc, argv);

    printf("my_signal sign\n");

    // my_signal sign;
    // my_slot slot;

    // QObject::connect(&sign, SIGNAL(signal_fun()), &slot, SLOT(slot_fun()));

    // emit sign.signal_fun();

    printf("app.exec()\n");

	return app.exec();
}
