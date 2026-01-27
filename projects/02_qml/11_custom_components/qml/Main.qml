import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true
    title: qsTr("QML Basic Elements")

    // Rectangle
    // {
    //     id: container_rect_id
    //     width: button_text_id.implicitWidth + 10
    //     height: button_text_id.implicitHeight + 10
    //     color: "red"
    //     border.color: "blue"
    //     border.width: 3

    //     Text
    //     {
    //         id: button_text_id
    //         text: "button"
    //         anchors.centerIn: parent
    //     }

    //     MouseArea
    //     {
    //         anchors.fill: parent
    //         onClicked: {
    //             console.log("clicked on the button")
    //         }
    //     }
    // }

    Column
    {
        spacing: 3

        MButton
        {
            id: button1_id
            button_text: "button1"
            onButton_clicked: {
                console.log("Clicked on button1")
            }
        }

        MButton
        {
            id: button2_id
            button_text: "button2"
            onButton_clicked: {
                console.log("Clicked on button2")
            }
        }
    }
}
