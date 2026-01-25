import QtQuick

Window
{
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("QML Syntax Demo")

    property string text_to_show: "hello"

    Row
    {
        anchors.centerIn: parent
        spacing: 20
        Rectangle
        {
            id: red_rect_id
            width: 100
            height: 100
            color: "red"
            // anchors.centerIn: parent
            radius: 15
            border.color: "black"
            border.width: 5
            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    console.log("clicked on the red rectangle")
                    root.text_to_show = "red"
                }
            }
        }
        Rectangle
        {
            id: green_rect_id
            width: 100
            height: 100
            color: "green"
            // anchors.centerIn: parent
            radius: 15
            border.color: "black" 
            border.width: 5
            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    console.log("clicked on the green rectangle")
                    root.text_to_show = "green"
                }
            }
        }
        Rectangle
        {
            id: blue_rect_id
            width: 100
            height: 100
            color: "blue"
            // anchors.centerIn: parent
            radius: 15
            border.color: "black"
            border.width: 5
            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    console.log("clicked on the blue rectangle")
                    root.text_to_show = "blue"
                }
            }
        }
        Rectangle
        {
            id: circle_id
            width: 100
            height: 100
            color: "dodgerblue"
            // anchors.centerIn: parent
            radius: 60
            border.color: "black"
            border.width: 5

            Text
            {
                id: text_id
                anchors.centerIn: parent
                text: root.text_to_show
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    console.log("clicked on the circle rectangle")
                    text_id.text = "broken"
                }
            }
        }
    }

}
