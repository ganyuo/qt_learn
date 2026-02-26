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
            text: "Choose font"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                fontDialog_id.open()
            }
        }

        Text {
            id: text_id
            text: "Hello World"
            wrapMode: Text.Wrap
        }

        FontDialog {
            id: fontDialog_id
            title: "Choose font"
            onAccepted: function() {
                console.log("Choose font: " + currentFont)
                text_id.font = currentFont
            }

            onRejected: function() {
                console.log("User rejected font")
            }
        }
    }
}
