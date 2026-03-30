#include "qml_js_caller.hpp"
#include <QVariant>
#include <QDebug>

qml_js_caller_t::qml_js_caller_t(QObject *parent) : QObject(parent)
{
}

Q_INVOKABLE void qml_js_caller_t::cpp_method(QString parameter)
{
    qDebug() << "This is C++ talking, calling QML Javascript function";
    call_js_method(parameter);
}

void qml_js_caller_t::set_qml_root_object(QObject *value)
{
    qml_root_object = value;
}

void qml_js_caller_t::call_js_method(QString param)
{
    QVariant return_value;
    QVariant cpp_parameter = QVariant::fromValue(param);

    QMetaObject::invokeMethod(qml_root_object, "qml_js_function",
                              Q_RETURN_ARG(QVariant, return_value),
                              Q_ARG(QVariant, cpp_parameter));
    qDebug() << "C++会话， 调用QML Javascript完成，返回值是: " << return_value.toString();
}
