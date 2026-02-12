import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle {
        id: container_rect_id
        width: 300
        height: width
        border.color: "black"
        anchors.centerIn: parent

        Rectangle {
            id: top_left_rect_id
            width: 100
            height: width
            color: "magenta"
            Text {
                anchors.centerIn: parent
                text: "1"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: top_center_rect_id
            width: 100
            height: width
            color: "yellowgreen"
            anchors.left: top_left_rect_id.right
            Text {
                anchors.centerIn: parent
                text: "2"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: top_right_rect_id
            width: 100
            height: width
            color: "dodgerblue"
            anchors.left: top_center_rect_id.right
            Text {
                anchors.centerIn: parent
                text: "3"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: center_left_rect_id
            width: 100
            height: width
            color: "red"
            anchors.top: top_left_rect_id.bottom
            Text {
                anchors.centerIn: parent
                text: "4"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: center_center_rect_id
            width: 100
            height: width
            color: "green"
            
            // anchors.left: center_left_rect_id.right
            // anchors.top: top_center_rect_id.bottom

            // anchors.topMargin: 10
            // anchors.leftMargin: 10

            // anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            anchors.horizontalCenterOffset: -10
            anchors.verticalCenterOffset: 10

            Text {
                anchors.centerIn: parent
                text: "5"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: center_right_rect_id
            width: 100
            height: width
            color: "blue"
            anchors.left: center_center_rect_id.right
            anchors.top: top_right_rect_id.bottom
            Text {
                anchors.centerIn: parent
                text: "6"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: bottom_left_rect_id
            width: 100
            height: width
            color: "royalblue"
            anchors.top: center_center_rect_id.bottom
            Text {
                anchors.centerIn: parent
                text: "7"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: bottom_center_rect_id
            width: 100
            height: width
            color: "yellow"
            anchors {
                left: center_center_rect_id.left
                top: center_center_rect_id.bottom
            }
            Text {
                anchors.centerIn: parent
                text: "8"
                font.pointSize: 20
            }
        }

        Rectangle {
            id: bottom_right_rect_id
            width: 100
            height: width
            color: "pink"
            anchors.left: center_center_rect_id.right
            anchors.top: center_center_rect_id.bottom
            Text {
                anchors.centerIn: parent
                text: "9"
                font.pointSize: 20
            }
        }
    }
}
