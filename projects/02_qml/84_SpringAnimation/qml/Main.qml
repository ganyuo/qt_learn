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

        Rectangle {
            id: target_rect_id
            width: 100
            height: 100
            x: 50
            y: 50
            color: "lightgreen"

/*
            Behavior on x {
                SpringAnimation {
                    spring: 5
                    damping: 0.2
                    duration: 3000
                }
            }

            Behavior on y {
                SpringAnimation {
                    spring: 5
                    damping: 0.2
                    duration: 3000
                }
            }
*/

            SpringAnimation {
                id: springAnimation_id
                target: target_rect_id
                property: "x"
                spring: 5
                damping: 0.2
                duration: 3000
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: function(mouse) {
                // target_rect_id.x = mouse.x
                // target_rect_id.y = mouse.y

                springAnimation_id.stop()
                springAnimation_id.from = container_rect_id.x
                springAnimation_id.to = mouse.x
                springAnimation_id.start()
            }
        }
    }
}
