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

        function respond_your_way(message) {
            console.log("custom response: " + message)
        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            rect_id.greet("The sky is blue")
        }
    }

    Component.onCompleted: {
        rect_id.greet.connect(rect_id.respond_your_way)
    }
}
