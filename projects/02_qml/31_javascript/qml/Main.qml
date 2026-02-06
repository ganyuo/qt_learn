import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle
    {
        id: container_rect_id
        width: 50
        height: get_height()
        color: x > 300 ? "red" : "green"
        // anchors.centerIn: parent

        function get_height()
        {
            return width * 2;
        }

        onXChanged: function()
        {
            console.log("x: " + x + ", y: " + y);
        }
    }

    MouseArea
    {
        anchors.fill: parent
        drag.target: container_rect_id
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.minimumY: 0
        drag.maximumX: parent.width - container_rect_id.width
        drag.maximumY: parent.height - container_rect_id.height
    }
}
