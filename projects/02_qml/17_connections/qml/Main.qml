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
        height: 300
        width: 200
        color: "dodgerblue"

        MouseArea
        {
            id: mouse_area_id
            anchors.fill: parent
        }
    }

    Connections
    {
        target: mouse_area_id
        function onClicked() {
            console.log("Clicked on the mouse area")
        }
        function onDoubleClicked(mouse) {
            console.log("Deouble clicked at: " + mouse.x)
        }
    }
}
