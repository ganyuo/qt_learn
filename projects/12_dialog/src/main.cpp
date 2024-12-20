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
#include <QDebug>

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

    /* 消息对话框 */
    main_layout.addWidget(add_dialog_button("信息消息框", [](){
        QMessageBox::information(nullptr, "信息消息框", "假装这是一条信息消息");
    }));

    main_layout.addWidget(add_dialog_button("警告消息框", [](){
        QMessageBox::warning(nullptr, "警告消息框", "假装这是一条警告消息");
    }));

    main_layout.addWidget(add_dialog_button("错误消息框", [](){
        QMessageBox::critical(nullptr, "错误消息框", "假装这是一条错误消息");
    }));

    main_layout.addWidget(add_dialog_button("问题消息框", [](){
        int ret = QMessageBox::question(nullptr, "问题消息框", "假装这是一个问题");
        if (ret == QMessageBox::Yes) {
            qDebug() << "return yes";
        }
        else {
            qDebug() << "return no";
        }
    }));

    /* 文件对话框 */
    main_layout.addWidget(add_dialog_button("打开单个文件", [](){
        QString file_path = QFileDialog::getOpenFileName();
        qDebug() << file_path;
    }));

    main_layout.addWidget(add_dialog_button("打开多个文件", [](){
        QStringList file_path_list = QFileDialog::getOpenFileNames();
        qDebug() << file_path_list;
    }));

    main_layout.addWidget(add_dialog_button("打开目录", [](){
        QString dir_path = QFileDialog::getExistingDirectory();
        qDebug() << dir_path;
    }));

    main_layout.addWidget(add_dialog_button("保存文件", [](){
        QString file_path = QFileDialog::getSaveFileName();
        qDebug() << file_path;
    }));

    /* 颜色对话框 */
    main_layout.addWidget(add_dialog_button("颜色对话框", [](){
        QColor color = QColorDialog::getColor();
        qDebug() << color;
    }));

    /* 字体对话框 */
    main_layout.addWidget(add_dialog_button("字体对话框", [](){
        bool flag = false;
        QFont font = QFontDialog::getFont(&flag);
        qDebug() << flag << ", " << font;
    }));

    /* 输入对话框 */
    main_layout.addWidget(add_dialog_button("输入浮点数", [](){
        double ret = QInputDialog::getDouble(nullptr, "输入对话框", "输入浮点数");
        qDebug() << ret;
    }));

    main_layout.addWidget(add_dialog_button("输入整数", [](){
        int ret = QInputDialog::getInt(nullptr, "输入对话框", "输入整数");
        qDebug() << ret;
    }));

    main_layout.addWidget(add_dialog_button("选择选项", [](){
        QString ret = QInputDialog::getItem(nullptr, "输入对话框", "选择选项", 
                                            {"选项_1", "选项_2", "选项_3"});
        qDebug() << ret;
    }));


    main_win.show();
    app.exec();
    return 0;
}