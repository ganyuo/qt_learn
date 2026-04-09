#ifndef DEFENDER_H
#define DEFENDER_H

#include <QObject>
#include <QtQml>
#include <player.h>

class Defender : public Player
{
    // 宏不会继承，所以要再次声明
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Defender(QObject *parent = nullptr);

    virtual void play();
    void defend();
};

#endif // DEFENDER_H
