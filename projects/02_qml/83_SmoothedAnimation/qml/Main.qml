import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle {
        id: container_rect_id
        anchors.fill: parent
        color: "beige"

/*
        Rectangle {
            id: target_rect_id
            width: 100
            height: 100
            x: 50
            y: 50
            color: "dodgerblue"

            SmoothedAnimation {
                id: smoothedAnimation_id
                target: target_rect_id
                property: "x"
                duration: 2000
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: function(mouse) {
                smoothedAnimation_id.from = container_rect_id.x
                smoothedAnimation_id.to = mouse.x
                smoothedAnimation_id.start()
            }
        }
*/

        Rectangle {
            width: 60; height: 60
            x: rect1.x - 5; y: rect1.y - 5
            color: "green"

            Behavior on x { SmoothedAnimation { velocity: 200 } }
            Behavior on y { SmoothedAnimation { velocity: 200 } }
        }

        Rectangle {
            id: rect1
            width: 50; height: 50
            color: "red"
        }

        focus: true
        Keys.onRightPressed: rect1.x = rect1.x + 100
        Keys.onLeftPressed: rect1.x = rect1.x - 100
        Keys.onUpPressed: rect1.y = rect1.y - 100
        Keys.onDownPressed: rect1.y = rect1.y + 100
    }
}
