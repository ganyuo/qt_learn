#include <QDebug>
#include "timerattached.h"

TimerAttached::TimerAttached(QObject *parent)
    : QObject{parent},
    m_timerPtr(new QTimer(this)),
    m_interval(1000),
    m_running(false)
{
    qDebug() << "Creating the timer attached object";
    connect(m_timerPtr, &QTimer::timeout, [=]{
        qDebug() <<"Timeout for interval: "<<m_interval;
        emit timerOut();
    });
}

TimerAttached::~TimerAttached()
{
    m_timerPtr->stop();
    delete m_timerPtr;
}

int TimerAttached::interval() const
{
    return m_interval;
}

void TimerAttached::setInterval(int newInterval)
{
    if (m_interval == newInterval)
        return;
    m_interval = newInterval;
    emit intervalChanged();
}

bool TimerAttached::running() const
{
    return m_running;
}

void TimerAttached::setRunning(bool newRunning)
{
    if (m_running == newRunning)
        return;
    m_running = newRunning;
    if (!m_running){
        m_timerPtr->stop();
    } else {
        m_timerPtr->start();
    }
    emit runningChanged();
}
