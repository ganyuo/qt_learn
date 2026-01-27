import QtQuick
import great_buttons

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true
    title: qsTr("QML Basic Elements")

    Column
    {
        spacing: 20

        Yellow_button
        {
            id: button1_id
            button_text: "button1"
            onButton_clicked: {
                console.log("Clicked on button1")
            }
        }

        Red_button
        {
            id: button2_id
            button_text: "button2"
            onButton_clicked: {
                console.log("Clicked on button2")
            }
        }

        Green_button
        {
            button_text: "button3"
        }

        Blue_button
        {
            button_text: "button4"
        }
    }
}
