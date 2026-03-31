#include "movie.hpp"
#include <QDebug>

Movie_t::Movie_t(QObject *parent) : QObject(parent)
{
    qDebug() << "Movie_t::Movie_t()";
}

QString Movie_t::title() const
{
    qDebug() << "Movie_t::title()";
    return _title;
}

QString Movie_t::main_character() const
{
    qDebug() << "Movie_t::main_character()";
    return _main_character;
}

void Movie_t::set_title(const QString &title)
{
    qDebug() << "Movie_t::set_title()";
    if (title == _title)
    {
        return ;
    }
    _title = title;
    emit title_changed();
}

void Movie_t::set_main_character(const QString &main_character)
{
    qDebug() << "Movie_t::set_main_character()";
    if (main_character == _main_character)
    {
        return ;
    }
    _main_character = main_character;
    emit main_character_changed();
}
