
#ifndef __CPPCLASS_HPP__
#define __CPPCLASS_HPP__

#include <QObject>
#include <QtQml>
#include <QFont>
#include <QColor>

class Cppclass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    // QML_SINGLETON

public:
    explicit Cppclass(QObject *parent = nullptr);

signals:
    void send_int(int param);
    void send_double(double param);
    void send_bool(bool param);
    void send_qreal(qreal param);
    void send_float(float param);

    void sendStringUrl(QString stringParam, QUrl urlParam);
    void sendColorFont(QColor colorParam, QFont fontParam);
    void sendDate(QDate dateParam);
    void sendPoint(QPoint pointParam, QPointF pointfParam);
    void sendSize(QSize sizeParam, QSizeF sizefParam);
    void sendRect(QRect rectParam, QRectF rectfParam);

public slots:
    void cpp_slot();

    void receive_point(QPoint point);
    void receive_rect(QRect rect);
};

#endif /* __CPPCLASS_HPP__ */
