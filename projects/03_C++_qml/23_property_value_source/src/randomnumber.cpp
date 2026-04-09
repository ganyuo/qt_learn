#include "randomnumber.h"

RandomNumber::RandomNumber(QObject *parent)
    : QObject{parent},
    m_maxValue(100),
    m_timerPtr(new QTimer(this))
{
    connect(m_timerPtr, SIGNAL(timeout()), this, SLOT(updateProperty()));
    m_timerPtr->start(2500);
}

void RandomNumber::setTarget(const QQmlProperty &prop)
{
    m_targetProperty = prop;
}

int RandomNumber::maxValue() const
{
    return m_maxValue;
}

void RandomNumber::setMaxValue(int newMaxValue)
{
    if (m_maxValue == newMaxValue)
        return;
    m_maxValue = newMaxValue;
    emit maxValueChanged();
}

void RandomNumber::updateProperty()
{
    m_targetProperty.write(QRandomGenerator::global()->bounded(m_maxValue));
}
