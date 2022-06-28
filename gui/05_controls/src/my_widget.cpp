#include "my_widget.h"

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

#include <QVBoxLayout>
#include <QCompleter>

my_widget::my_widget()
{
	this->setWindowTitle("my widget");
	QVBoxLayout *layout = new QVBoxLayout();
	this->setLayout(layout);

	/* QLabel */
	layout->addWidget(new QLabel("<font color='red'>label</font>"));

	/* QPushButton */
	QPushButton *push_button = new QPushButton("button");
	push_button->setStyleSheet("\
		QPushButton{\
			font: bold 16px;\
			color: red;\
		}\
	");
	layout->addWidget(push_button);

	/* QRadioButton */
	QRadioButton *radio_button = new QRadioButton("radio");
	radio_button->setStyleSheet("\
		QRadioButton{\
			font: bold 16px;\
			color: red;\
			padding: 20px;\
		}\
	");
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
	layout->addWidget(combo_box);

	/* QTextEdit */
	QTextEdit *text_edit = new QTextEdit();
	text_edit->setText(
		"<table border=1>"
		"	<tr><th>head1</th><th>head2</th></tr>"
		"	<tr><td>value_1</td><td>value_2</td></tr>"
		"	<tr><td>value_3</td><td>value_4</td></tr>"
		"</table>"
	);
	layout->addWidget(text_edit);

	layout->addWidget(new QGroupBox());

	layout->addWidget(new QSlider());

	layout->addWidget(new QSpinBox());

	layout->addWidget(new QDateTimeEdit());
}

my_widget::~my_widget()
{
}

