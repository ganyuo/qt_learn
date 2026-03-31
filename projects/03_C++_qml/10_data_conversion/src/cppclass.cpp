#include "cppclass.hpp"
#include <QDebug>

Cppclass::Cppclass(QObject *parent) : QObject(parent)
{
}

void Cppclass::cpp_slot()
{
    qDebug() << "cpp_slot() is called";
    emit send_int(123);
    emit send_double(123.44);
    emit send_bool(true);
    emit send_qreal(2.11);
    emit send_float(3.3);

    emit sendStringUrl("String from C++", QUrl("https://www.baidu.com"));
    emit sendColorFont(QColor(12,23,54), QFont("Times", 20, QFont::Bold));
    emit sendDate(QDate(1999, 7, 1));
    emit sendDate(QDate::currentDate());
    emit sendPoint(QPoint(100, 200), QPointF(32.3, 35.22));
    emit sendSize(QSize(200, 300), QSizeF(122.22, 533.21));
    emit sendRect(QRect(100, 100, 100, 100), QRectF(0, 0, 200, 150));
}

void Cppclass::receive_point(QPoint point)
{
    qDebug() << "receive_point() point: " << point;
}

void Cppclass::receive_rect(QRect rect)
{
    qDebug() << "receive_rect() rect: " << rect;
}
