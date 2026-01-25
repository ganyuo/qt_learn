import QtQuick

Window
{
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Property Bindings Demo")

    Rectangle
    {
        id: red_rect_id
        width: 50
        height: width * 1.5
        color: "red"
    }

    Rectangle
    {
        id: blue_rect_id
        width: 100
        height: 100
        color: "blue"
        anchors.bottom: parent.bottom

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                red_rect_id.width = red_rect_id.width + 10
            }
        }
    }

    Rectangle
    {
        id: green_rect_id
        color: "green"
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.left: blue_rect_id.right

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                // red_rect_id.height = 100
                // red_rect_id.height = red_rect_id.width * 2.5
                red_rect_id.height = Qt.binding(function() {
                    return red_rect_id.width * 2.5
                })
            }
        }
    }
}
