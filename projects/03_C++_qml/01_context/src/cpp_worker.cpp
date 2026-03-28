#include "cpp_worker.hpp"
#include <QDebug>

cpp_worker::cpp_worker(QObject *parent) : QObject(parent)
{
}

cpp_worker::~cpp_worker()
{
}

void cpp_worker::regular_method()
{
    qDebug() << "This is C++ talking, regular_method() called.";
}

QString cpp_worker::regular_method_with_return(QString name, int age)
{
    qDebug() << "This is C++ talking, name: " << name << ", age: " << age;
    return QString(name + ":" + QString::number(age) + " years old.");
}

void cpp_worker::cpp_clot()
{
    qDebug() << "This is C++ talking, cpp_clot() called.";
}