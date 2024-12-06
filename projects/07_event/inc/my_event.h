#ifndef MY_EVENT_H
#define MY_EVENT_H

#include <QWidget>
#include <QMouseEvent>
#include <QKeyEvent>

class my_event : public QWidget
{
	// Q_OBJECT
private:
	/* data */
public:
	my_event();
	~my_event();

	/* 事件处理主函数，主要用来截取事件 */
	bool event(QEvent *ev);

	/* 鼠标按下事件处理 */
	void mousePressEvent(QMouseEvent *ev);
	/* 鼠标释放事件处理 */
	void mouseReleaseEvent(QMouseEvent *ev);
	/* 鼠标移动事件处理 */
	void mouseMoveEvent(QMouseEvent *ev);
	/* 鼠标双击事件处理 */
	void mouseDoubleEvent(QMouseEvent *ev);

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

#endif /* MY_EVENT_H */