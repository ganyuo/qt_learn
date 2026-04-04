#include "cppclass.hpp"
#include <QDebug>

Cppclass::Cppclass(QObject *parent) : QObject(parent)
{
    _vector.append("one");
    _vector.append("two");
    _vector.append("three");
    _vector.append("four");
}

Q_INVOKABLE void Cppclass::qml_array_to_cpp(QVector<QString> vector)
{
    for (int i = 0; i < vector.size(); i++)
    {
        qDebug() << vector[i];
    }
}

Q_INVOKABLE QVector<QString> Cppclass::retrieve_stings()
{
    return _vector;
}