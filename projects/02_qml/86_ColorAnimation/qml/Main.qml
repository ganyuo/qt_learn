import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle {
        id: target_rect_id
        width: 100
        height: width
        color: "red"

        ColorAnimation {
            id: colorAnimation_id
            target: target_rect_id
            property: "color"
            from: target_rect_id.color
            to: "blue"
            duration: 5000
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: function() {
            colorAnimation_id.start()
        }
    }
}
