import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button {
            text: "Choose color"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                colorDialog_id.open()
            }
        }

        Rectangle {
            id: rect_id
            width: 200
            height: 200
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "black"
        }

        ColorDialog {
            id: colorDialog_id
            title: "Choose color"
            onAccepted: function() {
                console.log("Choose color: " + selectedColor)
                rect_id.color = selectedColor
            }

            onRejected: function() {
                console.log("User rejected color")
            }
        }
    }
}
