#ifndef __MOVIE_HPP__
#define __MOVIE_HPP__

#include <QObject>

class movie_t : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ title WRITE set_title NOTIFY title_changed FINAL)
    Q_PROPERTY(QString main_character READ main_character WRITE set_main_character NOTIFY main_character_changed FINAL)

public:
    explicit movie_t(QObject *parent = nullptr);

    QString title() const;
    QString main_character() const;

    void set_title(const QString& title);
    void set_main_character(const QString& main_character);

signals:
    void title_changed();
    void main_character_changed();

private:
    QString _title;
    QString _main_character;
};

#endif /* __MOVIE_HPP__ */
