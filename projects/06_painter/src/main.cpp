#include <QApplication>
#include <QWidget>
#include <QPainter>
#include <QPixmap>
#include <QDebug>

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

    qDebug() << "start draw\n";

    /* 消锯齿 */
    painter.setRenderHint(QPainter::Antialiasing);
    /* 设置画笔，线条为红色，线宽为2，使用虚线 */
    painter.setPen(QPen(Qt::red , 2, Qt::DashLine));
    /* 设置画刷，当画矩形等封闭图形时，用黄色填充 */
    painter.setBrush(Qt::yellow);
    /* 设置字体，楷体，大小为40，700加粗，斜体 */
    painter.setFont(QFont("楷体", 40, 700, true));

    /* 画直线 */
    painter.drawLine(20, 40, 200, 40);
    /* 画圆 */
    painter.drawEllipse(QPoint(100, 120), 50, 50);
    /* 写字 */
    painter.drawText(QPoint(20, 240), "hello world");

    /* 向左移动400 */
    painter.translate(400, 0);
    /* 画图片 */
    painter.drawPixmap(QPoint(0, 20), QPixmap("./image/滑稽.png"));
    // /* 画矩形 */
    painter.drawRect(QRect(0, 120, 100, 50));
    // /* 画圆角矩形 */
    painter.drawRoundedRect(QRect(0, 200, 100, 50), 15, 15, Qt::AbsoluteSize);

    qDebug() << "end draw\n";
}

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	my_painter widget;
	widget.show();

	return app.exec();
}
