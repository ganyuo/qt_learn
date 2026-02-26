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
            text: "Choose folder"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                folderDialog_id.open()
            }
        }

        Text {
            id: text_id
            text: "User hasn't choosen yet"
            wrapMode: Text.Wrap
        }

        FolderDialog {
            id: folderDialog_id
            title: "Choose folder"
            currentFolder: folderDialog_id.currentFolder
            onAccepted: function() {
                console.log("Choose folder: " + currentFolder)
                text_id.text = currentFolder
            }

            onRejected: function() {
                console.log("User rejected folder")
            }
        }
    }
}
