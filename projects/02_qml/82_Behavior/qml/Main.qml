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

            Behavior on x {
                NumberAnimation {
                    duration: 1000
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: function(mouse) {
                targe_rect_id.x = mouse.x
            }
        }
    }
}
