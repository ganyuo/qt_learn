#ifndef __ERROR_LEVEL_HPP__
#define __ERROR_LEVEL_HPP__

#include <QObject>
#include <QtQml>

class Error_level : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    Error_level(QObject * parent = nullptr);

    enum Error_value {
        INFORMATION,
        WARNING,
        DEBUG,
        MESSAGE
    };

    Q_ENUM(Error_value)
};

#endif /* __ERROR_LEVEL_HPP__ */
