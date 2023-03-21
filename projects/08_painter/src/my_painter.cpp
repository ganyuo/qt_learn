#include "my_painter.h"
#include <QWidget>
#include <QPrinter>
#include <QPixmap>

my_painter::my_painter(QWidget *parent) : QWidget(parent)
{
}

my_painter::~my_painter()
{
}

void my_painter::paintEvent(QPaintEvent *e)
{
    QPainter painter(this);

    painter.
}