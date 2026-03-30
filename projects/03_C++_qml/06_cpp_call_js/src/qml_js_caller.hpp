#ifndef __QML_JS_CALLER_HPP__
#define __QML_JS_CALLER_HPP__

#include <QObject>

class qml_js_caller_t : public QObject
{
    Q_OBJECT

public:
    explicit qml_js_caller_t(QObject *parent = nullptr);

    Q_INVOKABLE void cpp_method(QString parameter);

    void set_qml_root_object(QObject *value);

private:
    void call_js_method(QString param);
    QObject *qml_root_object;
};

#endif /* __QML_JS_CALLER_HPP__ */
