#ifndef __CPP_WORKER_HPP__
#define __CPP_WORKER_HPP__

#include <QObject>

class cpp_worker : public QObject
{
    Q_OBJECT
private:
    /* data */
public:
    cpp_worker(QObject *parent = nullptr);
    ~cpp_worker();

    Q_INVOKABLE void regular_method();
    Q_INVOKABLE QString regular_method_with_return(QString name, int age);

public slots:
    void cpp_clot();
};

#endif /* __CPP_WORKER_HPP__ */
