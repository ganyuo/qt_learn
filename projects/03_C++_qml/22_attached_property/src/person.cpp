#include "person.h"

Person::Person(QObject *parent)
    : QObject{parent}
{}

QString Person::name() const
{
    return m_name;
}

void Person::setName(const QString &newM)
{
    if (m_name == newM)
        return;
    m_name = newM;
    emit nameChanged();
}

int Person::age() const
{
    return m_age;
}

void Person::setAge(int newAge)
{
    if (m_age == newAge)
        return;
    m_age = newAge;
    emit ageChanged();
}
