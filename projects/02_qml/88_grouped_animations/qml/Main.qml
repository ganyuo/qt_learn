import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    readonly property int animation_duration: 500

    property bool going_down: true

    function animaition_circle() {
        if (going_down === true) {
            going_down = false
            x_animation_id.to = root_id.width - circle_id.width
            y_animation_id.to = root_id.height - circle_id.height
            grouped_animation_id.start()
        }
        else {
            going_down = true
            x_animation_id.to = 0
            y_animation_id.to = 0
            grouped_animation_id.start()
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "gray"

        Rectangle {
            id: circle_id
            width: 100
            height: 100
            radius: 50
            color: "lightgreen"

            SequentialAnimation {
            // ParallelAnimation {
                id: grouped_animation_id

                NumberAnimation {
                    id: x_animation_id
                    target: circle_id
                    property: "x"
                    duration: root_id.animation_duration
                }

                NumberAnimation {
                    id: y_animation_id
                    target: circle_id
                    property: "y"
                    duration: root_id.animation_duration
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    root_id.animaition_circle()
                }
            }
        }
    }
}
