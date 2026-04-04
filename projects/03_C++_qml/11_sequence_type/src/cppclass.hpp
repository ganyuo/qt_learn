
#ifndef __CPPCLASS_HPP__
#define __CPPCLASS_HPP__

#include <QObject>
#include <QtQml>

class Cppclass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    // QML_SINGLETON

public:
    explicit Cppclass(QObject *parent = nullptr);

    Q_INVOKABLE void qml_array_to_cpp(QVector<QString> vector);
    Q_INVOKABLE QVector<QString> retrieve_stings();

private:
    QVector<QString> _vector;
};

#endif /* __CPPCLASS_HPP__ */
