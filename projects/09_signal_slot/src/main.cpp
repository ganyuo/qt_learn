#include <QCoreApplication>
#include <QObject>
#include <QDebug>

class my_signal : public QObject
{
    Q_OBJECT
private:
    /* data */
public:
    my_signal() {};
    ~my_signal() {};

signals:
    void signal_fun() {};
};

class my_slot : public QObject
{
    Q_OBJECT
private:
    /* data */
public:
    my_slot() {};
    ~my_slot() {};

public slots:
    void slot_fun(){
        qDebug() << "my_slot::slot_fun is called";
    }
};


int main(int argc, char *argv[])
{
	QCoreApplication app(argc, argv);

    my_signal signal;
    my_slot slot;

    QObject::connect(&signal, SIGNAL(my_signal::signal_fun()), &slot, SLOT(my_slot::slot_fun()));

    emit signal.signal_fun();

	return app.exec();
}
