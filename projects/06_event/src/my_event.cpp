#include "my_event.h"
#include <QWidget>
#include <QEvent>
#include <QDebug>
#include <QMouseEvent>
#include <QKeyEvent>
#include <QVBoxLayout>
#include <QPushButton>
#include <QLineEdit>
#include <QPainter>

my_event::my_event()
{
	// this->setMouseTracking(true);
	QVBoxLayout *layout = new QVBoxLayout();
	this->setLayout(layout);

	QLineEdit *line_edit = new QLineEdit();
	connect(line_edit, &QLineEdit::returnPressed, []()
	{
		qDebug() << "line edit return press";
	});
	this->layout()->addWidget(line_edit);

	QPushButton *button_1 = new QPushButton("OK");
	connect(button_1, &QPushButton::clicked, []()
	{
		qDebug() << "OK clicked";
	});
	// button_1->setDefault(true);
	this->layout()->addWidget(button_1);

	QPushButton *button_2 = new QPushButton("cencel");
	connect(button_2, &QPushButton::clicked, []()
	{
		qDebug() << "cencel clicked";
	});
	this->layout()->addWidget(button_2);
}

my_event::~my_event()
{
}

/* 事件处理主函数，主要用来截取事件 */
bool my_event::event(QEvent *ev)
{
	// /* 截取鼠标事件 */
	// if(ev->type() == QEvent::MouseButtonPress)
	// {
	// 	qDebug() << "mouse press";
	// 	return true;
	// }

	/* 默认的事件处理函数 */
	return QWidget::event(ev);
}

/* 鼠标按下事件处理 */
void my_event::mousePressEvent(QMouseEvent *ev)
{
	QPoint pt = ev->pos();
	qDebug() << pt;

	if(ev->button() == Qt::LeftButton)
	{
		qDebug() << "left button push";
	}
	if(ev->modifiers() == Qt::ShiftModifier)
	{
		qDebug() << "shift push";
	}
}

/* 鼠标释放事件处理 */
void my_event::mouseReleaseEvent(QMouseEvent *ev)
{
}

/* 鼠标移动事件处理 */
void my_event::mouseMoveEvent(QMouseEvent *ev)
{
	static int i = 0;
	/* 只有鼠标按下时移动，才能触发事件 */
	qDebug() << "mouse move " << i++;
	/* 如果要在鼠标不按下时，也触发事件，需要在构造函数中运行下面的代码 */
	// this->setMouseTracking(true);
}

/* 鼠标双击事件处理 */
void my_event::mouseDoubleEvent(QMouseEvent *ev)
{
}

/* 键盘按下事件处理 */
void my_event::keyPressEvent(QKeyEvent *ev)
{
	ev->modifiers();

	int key = ev->key();
	qDebug() << key;
	char ch = (char)key;
	qDebug() << ch;
}

/* 键盘释放事件处理 */
void my_event::keyReleaseEvent(QKeyEvent *ev)
{
}

/* 窗口隐藏事件处理 */
void my_event::hideEvent(QHideEvent *ev)
{
	qDebug() << "hide event";
}

/* 窗口显示事件处理 */
void my_event::showEvent(QShowEvent *ev)
{
	qDebug() << "show event";
}

/* 重绘事件处理 */
void my_event::paintEvent(QPaintEvent *ev)
{
	qDebug() << "paint event";
	
	QPainter painter(this);
	painter.drawLine(QPoint(0, 0), QPoint(100, 100));
}

/* 窗口关闭事件处理 */
void my_event::closeEvent(QCloseEvent *ev)
{
	qDebug() << "close event";
}