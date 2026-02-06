import QtQuick
import components
import constants
import utilities

Window
{
    id: root_id
    width: Constants.window_width
    height: Constants.window_height
    visible: true

    Column
    {
        spacing: 3

        Mbutton
        {
            id: button1_id
            button_text: "button1"
            onButton_clicked: {
                Utils.button_alert(button_text)
                // console.log("Clicked on button1")
            }
        }

        Mbutton
        {
            id: button2_id
            button_text: "button2"
            onButton_clicked: {
                Utils.button_alert(button_text)
                // console.log("Clicked on button2")
            }
        }
    }
}
