#ifndef RANDOMNUMBER_H
#define RANDOMNUMBER_H

#include <QObject>
#include <QQmlPropertyValueSource>
#include <QQmlProperty>
#include <QTimer>
#include <QtQml>

class RandomNumber : public QObject, public QQmlPropertyValueSource
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int maxValue READ maxValue WRITE setMaxValue NOTIFY maxValueChanged FINAL)
    Q_INTERFACES(QQmlPropertyValueSource)

public:
    explicit RandomNumber(QObject *parent = nullptr);
    virtual void setTarget(const QQmlProperty& prop);


    int maxValue() const;
    void setMaxValue(int newMaxValue);

signals:
    void maxValueChanged();

private slots:
    void updateProperty();

private:
    int m_maxValue;
    QQmlProperty m_targetProperty;
    QTimer* m_timerPtr;
};

#endif // RANDOMNUMBER_H
