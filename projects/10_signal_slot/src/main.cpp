#include <QApplication>
#include <QWidget>
#include <QPushButton>
#include <QDebug>

#include "my_signal.h"
#include "my_slot.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

    qDebug() << "my_signal sign\n";

    QWidget main_win;
    QPushButton button;
    button.setText("send_signal");
    button.setParent(&main_win);
    main_win.show();

    my_signal sign;
    my_slot slot;

    QObject::connect(&sign, SIGNAL(signal_fun()), &slot, SLOT(slot_fun()));
    QObject::connect(&button, SIGNAL(clicked()), &sign, SLOT(send_signal()));

    qDebug() << "app.exec()\n";

	return app.exec();
}
