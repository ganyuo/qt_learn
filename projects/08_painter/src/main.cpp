#include <QApplication>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	event_filter widget;
	widget.show();

	return app.exec();
}
