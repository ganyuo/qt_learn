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
        width: 150
        height: 150
        color: "red"

        MouseArea
        {
            anchors.fill: parent

            // onClicked: {
            //     console.log("position x: " + mouse.x + ", y: " + mouse.y)
            // }

            // onClicked: function(mouse) {
            //     console.log("position x: " + mouse.x + ", y: " + mouse.y)
            // }

            onClicked: mouse => {
                console.log("position x: " + mouse.x + ", y: " + mouse.y)
            }
        }
    }
}
