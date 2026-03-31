#include "singleton.hpp"
#include <QDebug>

Singleton::Singleton(QObject *parent) : QObject(parent)
{
}

Q_INVOKABLE void Singleton::do_something() const
{
    qDebug() << "doing somethings...";
}
