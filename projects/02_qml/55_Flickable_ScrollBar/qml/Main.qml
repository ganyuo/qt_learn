import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Flickable {
        width: parent.width
        height: parent.height
        contentHeight: column_id.implicitHeight

        ScrollBar.vertical: ScrollBar {
        }

        Column {
            id: column_id
            anchors.fill: parent

            Rectangle {
                color: "red"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "element1"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "pink"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "elemen2"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "yellowgreen"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "elemen3"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "dodgerblue"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "element4"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "green"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "element5"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "yellow"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "element6"
                    font.pointSize: 30
                    color: "white"
                }
            }
        }
    }
}
