#ifndef __CPP_SIGNAL_SENDER_HPP__
#define __CPP_SIGNAL_SENDER_HPP__

#include <QObject>
#include <QTimer>

class cpp_signal_sender : public QObject
{
    Q_OBJECT
public:
    explicit cpp_signal_sender(QObject *parent = nullptr);

signals:
    void call_qml(QString parameter);
    void call_timer(QString value);

public slots:
    void cpp_slot();

private:
    QTimer *_timer;
    int _value;
};

#endif /* __CPP_SIGNAL_SENDER_HPP__ */
