import QtQuick
import QtQuick.Layouts

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    ColumnLayout
    {
        Layout.topMargin: 10
        spacing: 50

        Label_text_input
        {
            id: first_name_id
            label: "first name: "
            place_holder_text: "type in your first name..."
            onEditing_finished: {
                console.log("the first name changed to: " + first_name_id.text)
            }
        }

        Label_text_input
        {
            id: last_name_id
            label: "last name: "
            place_holder_text: "type in your last name..."
            onEditing_finished: {
                console.log("the last name changed to: " + last_name_id.text)
            }
        }
    }

}
