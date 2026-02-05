import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Row
    {
        x: 10
        y: 10
        spacing: 20

        Rectangle
        {
            id: first_name_rect_id
            width: first_name_label_id.implicitWidth
            height: first_name_label_id.implicitHeight
            color: "dodgerblue"

            Text
            {
                id: first_name_label_id
                anchors.centerIn: parent
                text: "first name: "
            }
        }

        Rectangle
        {
            id: first_name_text_rect_id
            width: first_name_text_id.implicitWidth
            height: first_name_text_id.implicitHeight
            color: "dodgerblue"

            TextInput
            {
                id: first_name_text_id
                anchors.centerIn: parent
                focus: true
                text: "type in your first name"
                onEditingFinished: {
                    console.log("The first name changed to: " + text)
                }
            }
        }
    }

    Row
    {
        x: 10
        y: 60
        spacing: 20

        Rectangle
        {
            id: last_name_rect_id
            width: last_name_label_id.implicitWidth
            height: last_name_label_id.implicitHeight
            color: "dodgerblue"

            Text
            {
                id: last_name_label_id
                anchors.centerIn: parent
                text: "last name: "
            }
        }

        Rectangle
        {
            id: last_name_text_rect_id
            width: last_name_text_id.implicitWidth
            height: last_name_text_id.implicitHeight
            color: "dodgerblue"

            TextInput
            {
                id: last_name_text_id
                anchors.centerIn: parent
                focus: true
                text: "type in your last name"
                onEditingFinished: {
                    console.log("The last name changed to: " + text)
                }
            }
        }
    }

}
