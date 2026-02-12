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

            anchors.top: sibling_rect_id.top

            Text {
                anchors.centerIn: parent
                text: "1"
                font.pointSize: 20
            }
        }
    }

    Rectangle {
        id: sibling_rect_id
        width: 200
        height: width
        color: "black"
        anchors.right: container_rect_id.left
        anchors.top: container_rect_id.top
    }
}
