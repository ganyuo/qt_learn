import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle
    {
        id: rect_id
        height: 200
        width: 300
        color: "dodgerblue"

        signal greet(string message)

        onGreet: function(message) {
            console.log("greeting with message: " + message)
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rect_id.greet("the sky is blue")
            }
        }
    }
}
