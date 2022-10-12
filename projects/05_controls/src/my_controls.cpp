#include "my_controls.h"

#include <QDebug>

#include <QLabel>
#include <QPushButton>
#include <QLineEdit>
#include <QComboBox>
#include <QCheckBox>
#include <QRadioButton>
#include <QTextEdit>
#include <QGroupBox>
#include <QSlider>
#include <QSpinBox>
#include <QDateEdit>
#include <QTimeEdit>
#include <QDateTimeEdit>
#include <QLCDNumber>

#include <QVBoxLayout>
#include <QCompleter>
#include <QPixmap>

my_controls::my_controls()
{
	this->setWindowTitle("controls test");
	QVBoxLayout *layout = new QVBoxLayout();
	this->setLayout(layout);

	/* QLabel */
	QLabel *label = new QLabel("<a href='www.baidu.com'>baidu</a>");
	label->setPixmap(QPixmap("https://ganyuo.github.io/images/ganyuo.png"));
	connect(label, &QLabel::linkActivated, [](QString link)
	{
		qDebug() << link;
	});
	layout->addWidget(label);

	/* QPushButton */
	QPushButton *push_button = new QPushButton("button");
	push_button->setStyleSheet
	("\
		QPushButton{\
			font: bold 16px;\
			color: red;\
		}\
	");
	layout->addWidget(push_button);

	/* QRadioButton */
	QRadioButton *radio_button = new QRadioButton("radio");
	radio_button->setStyleSheet
	("\
		QRadioButton{\
			font: bold 16px;\
			color: red;\
			padding: 20px;\
		}\
	");
	connect(radio_button, &QRadioButton::clicked, [](bool checked)
	{
		qDebug() << checked;
	});
	layout->addWidget(radio_button);

	/* QCheckBox */
	layout->addWidget(new QCheckBox("check box"));

	/* QComboBox */
	QComboBox *combo_box = new QComboBox();
	combo_box->addItem("item 1");
	combo_box->addItem("item 2");
	combo_box->addItem("item 3");
	combo_box->setEditable(true);
	combo_box->setCompleter(new QCompleter(combo_box->model()));
	/* 由于QComboBox有两个重载的currentIndexChanged函数，需要用static_cast转换后才能识别到对应参数的函数 */
	connect(combo_box, static_cast<void (QComboBox::*)(const QString &)>(&QComboBox::currentIndexChanged), [](const QString str)
	{
		qDebug() << "combo_box index changed : " << str;
	});
	layout->addWidget(combo_box);

	/* QTextEdit */
	QTextEdit *text_edit = new QTextEdit();
	text_edit->setText(
		"<table border=1>"
		"	<tr><th>head1</th><th>head2</th></tr>"
		"	<tr><td>value_1</td><td>value_2</td></tr>"
		"	<tr><td>value_3</td><td>value_4</td></tr>"
		"</table>"
		"<br>"
		"<img src='https://ganyuo.github.io/images/ganyuo.png'></img>"
	);
	// text_edit->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
	// text_edit->setHorizontalScrollBarPolicy(Qt::ScrollBarAsNeeded);
	connect(text_edit, &QTextEdit::textChanged, [text_edit]()
	{
		qDebug() << text_edit->toPlainText();
	});
	layout->addWidget(text_edit);

	/* QGroupBox */
	QGroupBox *group_box = new QGroupBox("Some items");
	QHBoxLayout *hbox = new QHBoxLayout();
	hbox->addWidget(new QPushButton("aaa"));
	hbox->addWidget(new QPushButton("123"));
	group_box->setLayout(hbox);
	layout->addWidget(group_box);

	/* QSlider */
	QSlider *slider = new QSlider(Qt::Horizontal);
	slider->setMaximum(100);
	slider->setMinimum(0);
	layout->addWidget(slider);

	/* QSpinBox */
	QSpinBox *spin_box = new QSpinBox();
	spin_box->setMaximum(100);
	spin_box->setMinimum(0);
	layout->addWidget(spin_box);

	connect(slider, SIGNAL(valueChanged(int)), spin_box, SLOT(setValue(int)));
	connect(spin_box, SIGNAL(valueChanged(int)), slider, SLOT(setValue(int)));

	/* QDateTimeEdit */
	layout->addWidget(new QDateTimeEdit());

	/* QLCDNumber */
	QLCDNumber *lcd_number = new QLCDNumber(10);
	lcd_number->display("0123456789");
	layout->addWidget(lcd_number);
}

my_controls::~my_controls()
{
}

