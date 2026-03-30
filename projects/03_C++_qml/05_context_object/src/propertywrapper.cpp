#include "propertywrapper.h"
#include <cstdlib>
#include <ctime>

PropertyWrapper::PropertyWrapper(QObject *parent)
    : QObject{parent},
    m_lastname("LastName"),
    m_firstname("FirstName"),
    m_timer(new QTimer(this)),
    m_random_number(0)
{
    srand(static_cast<unsigned int>(time(nullptr)));
    QStringList list;
    list<<"Steward"<<"Johanson"<<"Oliver"<<"Snowden"<<"Kevin"<<"Mathson"<<"Gray";

    connect(m_timer, &QTimer::timeout, [=](){
        m_random_number = rand() % (list.size());
        setFirstname(list[m_random_number]);
    });
    m_timer->start(1000);
}

QString PropertyWrapper::lastname() const
{
    return m_lastname;
}

void PropertyWrapper::setLastname(const QString &newLastname)
{
    if (m_lastname == newLastname)
        return;
    m_lastname = newLastname;
    emit lastnameChanged();
}

QString PropertyWrapper::firstname() const
{
    return m_firstname;
}

void PropertyWrapper::setFirstname(const QString &newFirstname)
{
    if (m_firstname == newFirstname)
        return;
    m_firstname = newFirstname;
    emit firstnameChanged();
}
