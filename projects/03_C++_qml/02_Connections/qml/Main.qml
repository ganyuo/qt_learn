import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Row {
        spacing: 20

        Rectangle {
            id: red_rect_id
            width: 100
            height: width
            color: "red"

            MouseArea {
                id: red_rect_mouseArea_id
                anchors.fill: parent
                onClicked: function() {
                    console.log("This is the red rectangle responding")
                }
            }
        }
        Rectangle {
            id: green_rect_id
            width: 100
            height: width
            color: "green"
            Connections {
                target: red_rect_mouseArea_id
                function onClicked() {
                    console.log("This is the green rectangle responding")
                }
            }
        }
        Rectangle {
            id: blue_rect_id
            width: 100
            height: width
            color: "blue"
            Connections {
                target: red_rect_mouseArea_id
                function onClicked() {
                    console.log("This is the blue rectangle responding")
                }
            }
        }
    }
}
