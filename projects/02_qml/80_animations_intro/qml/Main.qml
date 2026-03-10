import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    property bool running: false

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

            PropertyAnimation on x {
                to: 530
                duration: 2000
                running: root_id.running
            }

            NumberAnimation on y {
                to: 300
                duration: 2000
                running: root_id.running
            }

            RotationAnimation on rotation {
                to: 600
                duration: 2000
                running: root_id.running
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: function() {
                root_id.running = true
            }
            onReleased: function() {
                root_id.running = false
            }
        }
    }
}
