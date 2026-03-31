#ifndef __SINGLETON_HPP__
#define __SINGLETON_HPP__

#include <QObject>
#include <QtQml>

class Singleton : public QObject
{
    Q_OBJECT
    // QML_ELEMENT
    // QML_SINGLETON

public:
    explicit Singleton(QObject *parent = nullptr);

    Q_INVOKABLE void do_something() const;
};

#endif /* __SINGLETON_HPP__ */
