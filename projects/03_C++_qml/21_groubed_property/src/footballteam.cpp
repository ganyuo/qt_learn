#include "footballteam.h"

FootBallTeam::FootBallTeam(QObject *parent)
    : QObject{parent}
{}

QString FootBallTeam::title() const
{
    return m_title;
}

void FootBallTeam::setTitle(const QString &newTitle)
{
    if (m_title == newTitle)
        return;
    m_title = newTitle;
    emit titleChanged();
}

QString FootBallTeam::coatch() const
{
    return m_coatch;
}

void FootBallTeam::setCoatch(const QString &newCoatch)
{
    if (m_coatch == newCoatch)
        return;
    m_coatch = newCoatch;
    emit coatchChanged();
}

Player *FootBallTeam::captain() const
{
    return m_captain;
}

void FootBallTeam::setCaptain(Player *newCaptain)
{
    if (m_captain == newCaptain)
        return;
    m_captain = newCaptain;
    emit captainChanged();
}

QQmlListProperty<Player> FootBallTeam::players()
{
    return QQmlListProperty<Player>(this, this, &FootBallTeam::appendPlayer,
                                    &FootBallTeam::playerCount,
                                    &FootBallTeam::player,
                                    &FootBallTeam::clearPlayers);
}


void FootBallTeam::appendPlayerCustom(Player* pPlayer)
{
    qDebug() << "Adding player to vector"<< pPlayer->name();
    m_players.append(pPlayer);
}

int FootBallTeam::playerCountCustom() const
{
    return m_players.count();
}

Player *FootBallTeam::playerCustom(int index) const
{
    return m_players.at(index);
}

void FootBallTeam::clearPlayerCustom()
{
    m_players.clear();
}

void FootBallTeam::appendPlayer(QQmlListProperty<Player>* pList, Player* pPlayer)
{
    reinterpret_cast<FootBallTeam*>(pList->data)->appendPlayerCustom(pPlayer);
}

qsizetype FootBallTeam::playerCount(QQmlListProperty<Player>* pList)
{
    return reinterpret_cast<FootBallTeam*>(pList->data)->playerCountCustom();
}

Player *FootBallTeam::player(QQmlListProperty<Player>* pList, qsizetype index)
{
    return reinterpret_cast<FootBallTeam*>(pList->data)->playerCustom(index);
}

void FootBallTeam::clearPlayers(QQmlListProperty<Player>* pList)
{
    reinterpret_cast<FootBallTeam*>(pList->data)->clearPlayerCustom();
}
