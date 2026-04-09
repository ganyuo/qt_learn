#ifndef PERSON_H
#define PERSON_H

#include <QObject>
#include <QtQml>

class Person : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged FINAL)


public:
    explicit Person(QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &newM);

    int age() const;
    void setAge(int newAge);

signals:
    void nameChanged();
    void ageChanged();

private:
    int m_age;
    QString m_name;
};

#endif // PERSON_H
