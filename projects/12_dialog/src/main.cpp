#include <QApplication>
#include <QObject>
#include <QWidget>
#include <QVBoxLayout>
#include <QPushButton>
#include <QDialog>
#include <QMessageBox>
#include <QFileDialog>
#include <QColorDialog>
#include <QFontDialog>
#include <QInputDialog>

QPushButton *add_dialog_button(QString button_text, std::function<void()> slot)
{
    QPushButton *button = new QPushButton(button_text);
    QObject::connect(button, &QPushButton::clicked, slot);
    return button;
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QWidget main_win;

    QVBoxLayout main_layout;
    main_win.setLayout(&main_layout);
    main_win.resize(160, 500);

    main_layout.addWidget(add_dialog_button("模态对话框", [](){
        QDialog model_dialog;
        model_dialog.setWindowTitle("模态对话框");
        model_dialog.exec(); /* 阻塞显示对话框 */
    }));

    main_layout.addWidget(add_dialog_button("非模态对话框", [](){
        QDialog *modaless_dialog = new QDialog();
        modaless_dialog->setWindowTitle("非模态对话框");
        /* 关闭窗口的时候触发delete操作，防止内存泄漏 */
        modaless_dialog->setAttribute(Qt::WA_DeleteOnClose);
        modaless_dialog->show(); /* 非阻塞显示对话框 */
    }));

    main_layout.addWidget(add_dialog_button("信息消息框", [&main_win](){
        QMessageBox::information(&main_win, "信息消息框", "假装这是一条信息消息");
    }));

    main_layout.addWidget(add_dialog_button("警告消息框", [&main_win](){
        QMessageBox::warning(&main_win, "警告消息框", "假装这是一条警告消息");
    }));

    main_layout.addWidget(add_dialog_button("错误消息框", [&main_win](){
        QMessageBox::critical(&main_win, "错误消息框", "假装这是一条错误消息");
    }));

    main_layout.addWidget(add_dialog_button("问题消息框", [&main_win](){
        QMessageBox::question(&main_win, "问题消息框", "假装这是一个问题");
    }));

    main_win.show();
    app.exec();
    return 0;
}