import QtQuick
import "utils.js" as Utils

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle
    {
        id: rect_id
        width: 300
        height: 120
        color: "green"
        anchors.centerIn: parent

        Text
        {
            text: "click me"
            anchors.centerIn: parent
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                Utils.greeting();
            }
        }
    }
}
