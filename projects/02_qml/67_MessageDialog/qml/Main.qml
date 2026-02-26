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
            text: "open message"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                messageDialog_id.open()
            }
        }
    }

    MessageDialog {
        id: messageDialog_id
        title: "message"
        text: "This is a message"
        buttons: MessageDialog.Ok | MessageDialog.Cancel

        onAccepted: function() {
            console.log("Dialog accepted")
        }

        onRejected: function() {
            console.log("Dialog rejected")
        }
    }
}
