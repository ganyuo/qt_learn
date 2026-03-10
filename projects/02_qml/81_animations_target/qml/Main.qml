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
            id: targe_rect_id
            width: 100
            height: 100
            x: 50
            y: 50
            color: "dodgerblue"

            PropertyAnimation {
                id: x_animation_id
                target: targe_rect_id
                property: "x"
                to: 530
                duration: 2000
            }

            NumberAnimation {
                id: y_animation_id
                target: targe_rect_id
                property: "y"
                to: 300
                duration: 2000
            }

            RotationAnimation {
                id: rotation_animation_id
                target: targe_rect_id
                property: "rotation"
                to: 600
                duration: 2000
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: function() {
                x_animation_id.start()
                y_animation_id.start()
                rotation_animation_id.start()
            }
            onReleased: function() {
                x_animation_id.stop()
                y_animation_id.stop()
                rotation_animation_id.stop()
            }
        }
    }
}
