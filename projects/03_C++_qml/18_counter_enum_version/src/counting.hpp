#ifndef __COUNTING_HPP__
#define __COUNTING_HPP__

#include <QObject>
#include <QtQml>

class Counting : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("")

private:
    Counting(QObject * parent = nullptr);
    ~Counting();
public:

    enum Count_direction {
        UP,
        DOWN
    };
    Q_ENUM(Count_direction)
};

#endif /* __COUNTING_HPP__ */
