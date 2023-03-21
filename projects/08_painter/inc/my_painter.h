#include <QWidget>
#include <QPaintEvent>

class my_painter : public QWidget
{
private:
    /* data */
public:
    my_painter(QWidget *);
    ~my_painter();

    void paintEvent(QPaintEvent *e);
};
