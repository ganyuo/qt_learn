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
        width: parent.width
        height: 200
        color: "beige"

        Rectangle
        {
            id: moving_rect_id
            width: 50
            height: width
            color: "blue"
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: function(mouse) {
                console.log(mouse.x)
                moving_rect_id.x = mouse.x
            }

            onWheel: function(wheel) {
                console.log("x: " + wheel.x + ", y: " + wheel.y + ", angleDelta: " + wheel.angleDelta)
            }

            hoverEnabled: true
            onHoveredChanged: {
                if (containsMouse)
                {
                    container_rect_id.color = "red"
                }
                else
                {
                    container_rect_id.color = "green"
                }
            }
        }
    }

    Rectangle
    {
        id: drag_container_id
        width: parent.width
        height: 200
        color: "beige"
        y: 250

        Rectangle
        {
            id: draggable_rect_id
            width: 50
            height: width
            color: "blue"
            onXChanged: {
                console.log("the x position is: " + x)
            }
        }

        MouseArea
        {
            anchors.fill: parent
            drag.target: draggable_rect_id
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: drag_container_id.width - draggable_rect_id.width
        }
    }
}
