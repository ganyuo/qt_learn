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

            hoverEnabled: true

            /*
            onClicked: {
                console.log("clicked the rectangle")
            }
            
            onDoubleClicked: {
                console.log("double clicked the rectangle")
            }
            
            onEntered: {
                console.log("you are in")
            }
            
            onExited: {
                console.log("you are out")
            }

            onWheel: function(wheel)
            {
                console.log("wheel.x: " + wheel.x)
            }

            onReleased: mouse => {
                console.log("released at x: " + mouse.x + ",y: " + mouse.y)
            }

            onPressAndHold: mouse => {
                console.log("Was held: " + mouse.wasHeld)
            }
            */

            onPositionChanged: mouse => {
                console.log("position changed, x: " + mouse.x + ", y: " + mouse.y)
            }
        }
    }
}
