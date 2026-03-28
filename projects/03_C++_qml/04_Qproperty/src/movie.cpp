#include "movie.hpp"
#include <QDebug>

movie_t::movie_t(QObject *parent) : QObject(parent)
{
}

QString movie_t::title() const
{
    return _title;
}

QString movie_t::main_character() const
{
    return _main_character;
}

void movie_t::set_title(const QString &title)
{
    if (title == _title)
    {
        return ;
    }
    _title = title;
    emit title_changed();
}

void movie_t::set_main_character(const QString &main_character)
{
    if (main_character == _main_character)
    {
        return ;
    }
    _main_character = main_character;
    emit main_character_changed();
}
