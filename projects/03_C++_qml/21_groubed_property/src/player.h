#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QtQml>
#include "playerdetails.h"

class Player : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(bool playing READ playing WRITE setPlaying NOTIFY playingChanged FINAL)
    Q_PROPERTY(QString position READ position WRITE setPosition NOTIFY positionChanged FINAL)
    Q_PROPERTY(PlayerDetails* details READ details  NOTIFY detailsChanged FINAL)
public:
    explicit Player(QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &newName);

    bool playing() const;
    void setPlaying(bool newPlaying);

    QString position() const;
    void setPosition(const QString &newPosition);

    Q_INVOKABLE virtual void play() = 0;

    PlayerDetails *details();

signals:
    void nameChanged();
    void playingChanged();

    void positionChanged();

    void detailsChanged();

private:
    QString m_name;
    bool m_playing;
    QString m_position;
    PlayerDetails m_details;
};

#endif // PLAYER_H
