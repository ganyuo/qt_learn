#include <QApplication>
#include <QWidget>
#include <QPainter>

class my_painter : public QWidget
{
private:
    /* data */
public:
    my_painter() {};
    ~my_painter() {};

    void paintEvent(QPaintEvent *e);
};

void my_painter::paintEvent(QPaintEvent *e)
{
    QPainter painter(this);

    painter.drawLine(0, 0, 100, 100);
}

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	my_painter widget;
	widget.show();

	return app.exec();
}
