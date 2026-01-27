import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true
    title: qsTr("QML Basic Elements")

    /*
    Row
    {
        spacing: 20

        Loader {
            id: first_button
            sourceComponent: button_component
            onLoaded: {
                var custom_button = first_button.item
                custom_button.button_text = "button1"
                custom_button.button_clicked.connect(function(){
                    console.log("clicked on button1")
                })
            }
        }

        Loader {
            id: second_button
            sourceComponent: button_component
            onLoaded: {
                var custom_button = second_button.item
                custom_button.button_text = "button2"
                custom_button.button_clicked.connect(function(){
                    console.log("clicked on button2")
                })
            }
        }
    }

    Component
    {
        id: button_component

        Item
        {
            id: root_id
            width: container_rect_id.width
            height: container_rect_id.height

            property alias button_text: button_text_id.text
            signal button_clicked

            Rectangle
            {
                id: container_rect_id
                width: button_text_id.implicitWidth + 10
                height: button_text_id.implicitHeight + 10
                color: "red"
                border.color: "blue"
                border.width: 3

                Text
                {
                    id: button_text_id
                    text: "button"
                    anchors.centerIn: parent
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        root_id.button_clicked() // 发出信号
                    }
                }
            }
        }
    }
    */

    component MButton: Rectangle
    {
        id: m_button_id
        width: button_text_id.implicitWidth + 10
        height: button_text_id.implicitHeight + 10
        color: "red"
        border.color: "blue"
        border.width: 3

        property alias button_text: button_text_id.text
        signal button_clicked

        Text
        {
            id: button_text_id
            text: "button"
            anchors.centerIn: parent
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                m_button_id.button_clicked() // 发出信号
            }
        }
    }


    Column
    {
        spacing: 20

        MButton
        {
            id: button3_id
            button_text: "button3"
            onButton_clicked: {
                console.log("Clicked on button3")
            }
        }

        MButton
        {
            id: button4_id
            button_text: "button4"
            onButton_clicked: {
                console.log("Clicked on button4")
            }
        }
    }
}
