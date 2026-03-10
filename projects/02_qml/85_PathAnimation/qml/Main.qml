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
            width: 50
            height: 50
            radius: 25
            color: "lightgreen"
            x: root_id.width * 0.5 - 25
            y: root_id.height * 0.9 - 25

            PathAnimation {
                id: pathAnimation_id
                target: target_rect_id
                duration: 1000
                anchorPoint: Qt.point(25, 25)

                path: Path {
                    startX: root_id.width * 0.5
                    startY: root_id.height * 0.9

                    PathAttribute {
                        name: "scale"
                        value: 1
                    }
                    PathCubic {
                        x: root_id.width * 0.1
                        y: root_id.height * 0.5
                        control1X: root_id.width * 0.3
                        control1Y: root_id.height
                        control2X: 0
                        control2Y: root_id.height * 0.7
                    }
                    PathAttribute {
                        name: "scale"
                        value: 0.5
                    }
                    PathCubic {
                        x: root_id.width * 0.5
                        y: root_id.height * 0.1
                        control1X: 0
                        control1Y: root_id.height * 0.3
                        control2X: root_id.width * 0.3
                        control2Y: 0
                    }
                    PathAttribute {
                        name: "scale"
                        value: 0.3
                    }
                    PathCubic {
                        x: root_id.width * 0.9
                        y: root_id.height * 0.5
                        control1X: root_id.width * 0.7
                        control1Y: 0
                        control2X: root_id.width
                        control2Y: root_id.height * 0.3
                    }
                    PathAttribute {
                        name: "scale"
                        value: 0.5
                    }
                    PathCubic {
                        x: root_id.width * 0.5
                        y: root_id.height * 0.9
                        control1X: root_id.width
                        control1Y: root_id.height * 0.7
                        control2X: root_id.width * 0.7
                        control2Y: root_id.height
                    }
                    PathAttribute {
                        name: "scale"
                        value: 1
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                pathAnimation_id.start()
            }
        }
    }
}
