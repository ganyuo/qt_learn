#include <QApplication>
#include "my_event.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	my_event widget;
	widget.show();

	return app.exec();
}
