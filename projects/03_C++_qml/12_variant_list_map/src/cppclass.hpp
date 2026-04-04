
#ifndef __CPPCLASS_HPP__
#define __CPPCLASS_HPP__

#include <QObject>
#include <QtQml>
#include <QVariantList>
#include <QVariantMap>

class Cppclass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    // QML_SINGLETON

public:
    explicit Cppclass(QObject *parent = nullptr);

    Q_INVOKABLE void pass_from_qml_to_cpp(QVariantList list, QVariantMap map);
    Q_INVOKABLE QVariantList get_variant_list_from_cpp();
    Q_INVOKABLE QVariantMap get_variant_map_from_cpp();

    void set_qml_root_object(QObject *value);

public slots:
    void trigger_js_call();

private:
    QObject *_qml_root_object;
};

#endif /* __CPPCLASS_HPP__ */
