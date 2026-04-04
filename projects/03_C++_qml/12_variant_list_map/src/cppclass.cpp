#include "cppclass.hpp"
#include <QColor>
#include <QDebug>

Cppclass::Cppclass(QObject *parent) : QObject(parent), _qml_root_object(nullptr)
{
}

Q_INVOKABLE void Cppclass::pass_from_qml_to_cpp(QVariantList list, QVariantMap map)
{
    qDebug() << "Received variant list and map from QML";
    qDebug() << "List :";
    for (int i = 0; i < list.size(); i++)
    {
        qDebug() << "List item : " << list.at(i).toString();
    }

    qDebug() << "Map :";
    for (auto iter = map.begin(); iter != map.end(); iter++)
    {
        qDebug() << "Map item : " << iter->toString();
    }
}

Q_INVOKABLE QVariantList Cppclass::get_variant_list_from_cpp()
{
    QVariantList list;
    list.append(123.4);
    list.append(QColor(Qt::green));
    list.append("ganyu");
    list.append(10);
    return list;
}

Q_INVOKABLE QVariantMap Cppclass::get_variant_map_from_cpp()
{
    QVariantMap map;
    map.insert("ganyu", "liyue");
    map.insert("sugar", "mengde");
    map.insert("waleisha", "nata");
    map.insert("release", QDate(2048, 10, 24));
    return map;
}

void Cppclass::set_qml_root_object(QObject *value)
{
    _qml_root_object = value;
}

void Cppclass::trigger_js_call()
{
    qDebug() << "calling js";
    QVariantList list;
    list.append(123.4);
    list.append(QColor(Qt::green));
    list.append("ganyu");
    list.append(10);

    QVariantMap map;
    map.insert("ganyu", "liyue");
    map.insert("sugar", "mengde");
    map.insert("waleisha", "nata");
    map.insert("release", QDate(2048, 10, 24));

    QMetaObject::invokeMethod(_qml_root_object, "array_object_fun",
        Q_ARG(QVariant, QVariant::fromValue(list)),
        Q_ARG(QVariant, QVariant::fromValue(map)));
    qDebug() << "called js";
}