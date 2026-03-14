import QtQuick

Item {
    id: root_id

    property var background_color
    property var start_color
    property var end_color
    property string easing_text
    property var anim_duration
    property var easing_type
    property var container_width

    width: container_rect_id.width
    height: container_rect_id.height

    Rectangle {
        id: container_rect_id
        width: root_id.container_width
        height: 50
        color: root_id.background_color

        Text {
            text: root_id.easing_text
            anchors.centerIn: parent
        }

        Rectangle {
            id: target_rect_id
            color: root_id.start_color
            width: 50
            height: 50
            border {
                width: 5
                color: "black"
            }
            radius: 10

            NumberAnimation {
                id: numberAnimation_id
                target: target_rect_id
                property: "x"
                easing.type: easing_type
                to: container_rect_id.width - target_rect_id.width
                duration: root_id.anim_duration
            }

            ColorAnimation {
                id: colorAnimation_id
                target: target_rect_id
                property: "color"
                from: target_rect_id.color
                to: root_id.end_color
                duration: root_id.anim_duration
            }

            MouseArea {
                anchors.fill: parent
                property bool to_right: true

                onClicked: function() {
                    if (to_right === true) {
                        to_right = false

                        numberAnimation_id.to = container_rect_id.width - target_rect_id.width
                        numberAnimation_id.start()

                        colorAnimation_id.to = root_id.end_color
                        colorAnimation_id.start()
                    }
                    else {
                        to_right = true

                        numberAnimation_id.to = 0
                        numberAnimation_id.start()

                        colorAnimation_id.to = root_id.start_color
                        colorAnimation_id.start()
                    }
                }
            }
        }
    }
}