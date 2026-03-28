#include "cpp_signal_sender.hpp"
#include <QDebug>

cpp_signal_sender::cpp_signal_sender(QObject *parent) : QObject(parent)
{
    _timer = new QTimer(this);
    _value = 0;
    QObject::connect(_timer, &QTimer::timeout, [=](){
        ++_value;
        emit this->call_timer(QString::number(_value));
    });
    _timer->start(1000);
}

void cpp_signal_sender::cpp_slot()
{
    emit call_qml("Information from C++");
}