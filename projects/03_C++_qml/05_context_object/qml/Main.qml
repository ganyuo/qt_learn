import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Row {
        spacing: 20

        Rectangle {
            id: rect1_id
            width: text1_id.implicitWidth + 20
            height: text1_id.implicitHeight + 20
            color: "beige"

            Text {
                id: text1_id
                anchors.centerIn: parent
                text: firstname
                font.pointSize: 20
            }
        }

        Rectangle {
            id: rect2_id
            width: text2_id.implicitWidth + 20
            height: text2_id.implicitHeight + 20
            color: "beige"

            Text {
                id: text2_id
                anchors.centerIn: parent
                text: lastname
                font.pointSize: 20
            }
        }

    }
}
