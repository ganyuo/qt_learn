#include "cppclass.hpp"
#include <QDebug>

Cppclass::Cppclass(QObject *parent) : QObject(parent)
{
}

void Cppclass::cpp_slot()
{
    qDebug() << "cpp_slot() is called";
    emit send_time(QTime::currentTime());
    emit send_date_time(QDateTime::currentDateTime());
}

void Cppclass::time_slot(QTime time)
{
    qDebug() << "time_slot() time: " << time;
}

void Cppclass::data_time_slot(QDateTime date_time)
{
    qDebug() << "data_time_slot() date_time: " << date_time;
}
