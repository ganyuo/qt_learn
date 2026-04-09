#ifndef TIMERATTACHED_H
#define TIMERATTACHED_H

#include <QObject>
#include <QtQml>
#include <QTimer>

class TimerAttached : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    QML_UNCREATABLE("Can't create an object of TimerAttached")

    Q_PROPERTY(int interval READ interval WRITE setInterval NOTIFY intervalChanged FINAL)
    Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged FINAL)
public:
    explicit TimerAttached(QObject *parent = nullptr);
    ~TimerAttached();

    int interval() const;
    void setInterval(int newInterval);

    bool running() const;
    void setRunning(bool newRunning);

signals:
    void intervalChanged();
    void runningChanged();
    void timerOut();

private:
    int m_interval;
    bool m_running;
    QTimer* m_timerPtr;
};

#endif // TIMERATTACHED_H
