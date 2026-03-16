import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle {
        id: container_rect_id
        anchors.fill: parent

        Rectangle {
            id: sky_rect_id
            width: parent.width
            height: 300
            color: "dodgerblue"
        }

        Rectangle {
            id: ground_rect_id
            width: parent.width
            anchors.top: sky_rect_id.bottom
            anchors.bottom: parent.bottom
            color: "lightgreen"
        }

        Image {
            id: tree_summer_id
            x: 50
            y: 100
            width: 200
            height: 300
            source: "qrc:/images/treesummersmall.png"
        }
        Image {
            id: tree_spring_id
            x: 50
            y: 100
            width: 200
            height: 300
            source: "qrc:/images/treespringsmall.png"
        }

        Rectangle {
            id: sun_rect_id
            x: parent.width - width - 100
            y: 50
            width: 100
            height: 100
            radius: 50
            color: "yellow"
        }

        states: [
            State {
                name: "spring"
                PropertyChanges {
                    target: sky_rect_id
                    color: "deepskyblue"
                }
                PropertyChanges {
                    target: tree_summer_id
                    opacity: 0
                }
                PropertyChanges {
                    target: tree_spring_id
                    opacity: 1
                }
                PropertyChanges {
                    target: ground_rect_id
                    color: "lime"
                }
                PropertyChanges {
                    target: sun_rect_id
                    color: "lightyellow"
                }
            },

            State {
                name: "summer"
                PropertyChanges {
                    target: sky_rect_id
                    color: "lightblue"
                }
                PropertyChanges {
                    target: tree_summer_id
                    opacity: 1
                }
                PropertyChanges {
                    target: tree_spring_id
                    opacity: 0
                }
                PropertyChanges {
                    target: ground_rect_id
                    color: "darkkhaki"
                }
                PropertyChanges {
                    target: sun_rect_id
                    color: "yellow"
                }
            }
        ]

        transitions: [
            Transition {
                from: "summer"
                to: "spring"
                ColorAnimation {
                    duration: 500
                }
                NumberAnimation {
                    property: "opacity"
                    duration: 500
                }
            },
            Transition {
                from: "spring"
                to: "summer"
                ColorAnimation {
                    duration: 500
                }
                NumberAnimation {
                    property: "opacity"
                    duration: 500
                }
            }
        ]

        state: "spring"

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                container_rect_id.state = (container_rect_id.state === "spring") ? "summer" : "spring"
            }
        }

    }

}
