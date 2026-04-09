#ifndef FOOTBALLTEAM_H
#define FOOTBALLTEAM_H

#include <QObject>
#include <QtQml>
#include <QVector>
#include <QQmlListProperty>
#include "player.h"

class FootBallTeam : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged FINAL)
    Q_PROPERTY(QString coatch READ coatch WRITE setCoatch NOTIFY coatchChanged FINAL)
    Q_PROPERTY(Player* captain READ captain WRITE setCaptain NOTIFY captainChanged FINAL)
    Q_PROPERTY(QQmlListProperty<Player> players READ players NOTIFY playersChanged FINAL)

public:
    explicit FootBallTeam(QObject *parent = nullptr);

    QString title() const;
    void setTitle(const QString &newTitle);

    QString coatch() const;
    void setCoatch(const QString &newCoatch);

    Player *captain() const;
    void setCaptain(Player *newCaptain);

    QQmlListProperty<Player> players();
    // void setPlayers(QQmlListProperty<Player> &new_players);


    // Helper methods
    void appendPlayerCustom(Player*);
    int playerCountCustom() const;
    Player* playerCustom(int) const;
    void clearPlayerCustom();

signals:
    void titleChanged();
    void coatchChanged();

    void captainChanged();

    void playersChanged();

private:

    static void appendPlayer(QQmlListProperty<Player>*, Player*);
    static qsizetype playerCount(QQmlListProperty<Player>*);
    static Player* player(QQmlListProperty<Player>*, qsizetype);
    static void clearPlayers(QQmlListProperty<Player>*);

    QString m_title;
    QString m_coatch;
    Player *m_captain = nullptr;
    QVector<Player*> m_players;
};

#endif // FOOTBALLTEAM_H
