import QtQuick
import QtQuick.Dialogs
import QtCore

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle {
        id: rect_id
        anchors.fill: parent
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                colorDialog_id.open()
            }

            ColorDialog {
                id: colorDialog_id
                title: "Choose rectangle color"
                onAccepted: function() {
                    rect_id.color = selectedColor
                }
                onRejected: function(){
                    console.log("Dialog reject")
                }
            }
        }
    }

    Settings {
        category: "window"
        property alias x: root_id.x
        property alias y: root_id.y
        property alias width: root_id.width
        property alias height: root_id.height
    }

    Settings {
        category: "colors"
        property alias rect_color: rect_id.color
    }
}
