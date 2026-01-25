#include <QApplication>
#include <QWidget>
#include <QMouseEvent>
#include <QKeyEvent>
#include <QMessageBox>
#include <QDebug>

class event_widget : public QWidget
{
protected:
    /* 事件处理主函数，主要用来截取事件 */
    bool event(QEvent *ev);

    /* 鼠标按下事件处理 */
    void mousePressEvent(QMouseEvent *ev);
    /* 鼠标释放事件处理 */
    void mouseReleaseEvent(QMouseEvent *ev);
    /* 鼠标移动事件处理 */
    void mouseMoveEvent(QMouseEvent *ev);
    /* 鼠标双击事件处理 */
    void mouseDoubleClickEvent(QMouseEvent *ev);

    /* 键盘按下事件处理 */
    void keyPressEvent(QKeyEvent *ev);
    /* 键盘释放事件处理 */
    void keyReleaseEvent(QKeyEvent *ev);

    /* 窗口隐藏事件处理 */
    void hideEvent(QHideEvent *ev);
    /* 窗口显示事件处理 */
    void showEvent(QShowEvent *ev);
    /* 重绘事件处理 */
    void paintEvent(QPaintEvent *ev);
    /* 窗口关闭事件处理 */
    void closeEvent(QCloseEvent *ev);
};

/* 事件处理主函数，主要用来截取事件 */
bool event_widget::event(QEvent *ev)
{
    /* 默认的事件处理函数 */
    return QWidget::event(ev);
}

/* 鼠标按下事件处理 */
void event_widget::mousePressEvent(QMouseEvent *ev)
{
    qDebug() << "mouse press event";
    QWidget::mousePressEvent(ev);
}

/* 鼠标释放事件处理 */
void event_widget::mouseReleaseEvent(QMouseEvent *ev)
{
    qDebug() << "mouse release event";
    QWidget::mouseReleaseEvent(ev);
}

/* 鼠标移动事件处理 */
void event_widget::mouseMoveEvent(QMouseEvent *ev)
{
    static int i = 0;
    /* 只有鼠标按下时移动，才能触发事件 */
    qDebug() << "mouse move " << i++;
    /* 如果要在鼠标不按下时，也触发事件，需要在构造函数中运行下面的代码 */
    // this->setMouseTracking(true);
    QWidget::mouseMoveEvent(ev);
}

/* 鼠标双击事件处理 */
void event_widget::mouseDoubleClickEvent(QMouseEvent *ev)
{
    qDebug() << "mouse double click event";
    QWidget::mouseDoubleClickEvent(ev);
}

/* 键盘按下事件处理 */
void event_widget::keyPressEvent(QKeyEvent *ev)
{
    qDebug() << "key press event " << ev->key();
    QWidget::keyPressEvent(ev);
}

/* 键盘释放事件处理 */
void event_widget::keyReleaseEvent(QKeyEvent *ev)
{
    qDebug() << "key release event " << ev->key();
    QWidget::keyPressEvent(ev);
}

/* 窗口隐藏事件处理 */
void event_widget::hideEvent(QHideEvent *ev)
{
    qDebug() << "hide event";
    QWidget::hideEvent(ev);
}

/* 窗口显示事件处理 */
void event_widget::showEvent(QShowEvent *ev)
{
    qDebug() << "show event";
    QWidget::showEvent(ev);
}

/* 重绘事件处理 */
void event_widget::paintEvent(QPaintEvent *ev)
{
    qDebug() << "paint event";
    QWidget::paintEvent(ev);
}

/* 窗口关闭事件处理 */
// void event_widget::closeEvent(QCloseEvent *ev)
// {
// 	qDebug() << "close event";
// 	QWidget::closeEvent(ev);
// }

/* 窗口关闭事件处理 */
void event_widget::closeEvent(QCloseEvent * event)
{
    QMessageBox::StandardButton ret;
    ret = QMessageBox::question(this, 
                                "Quit", "Are you sure to quit this application",
                                QMessageBox::Yes | QMessageBox::No,
                                QMessageBox::No);
    if(ret == QMessageBox::Yes) {
        event->accept();
    } else {
        event->ignore();
    }
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    event_widget widget;
    widget.show();

    return app.exec();
}
