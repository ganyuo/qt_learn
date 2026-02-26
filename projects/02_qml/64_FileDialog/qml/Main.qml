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
            text: "Choose file"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                fileDialog_id.open()
            }
        }

        Text {
            id: text_id
            text: "User hasn't choosen yet"
            wrapMode: Text.Wrap
        }

        FileDialog {
            id: fileDialog_id
            title: "Choose file"
            nameFilters : ["Text file (*.txt)", "HTML file (*.html *.htm)", "Image (*.jpg *.png)"]
            fileMode: FileDialog.OpenFile
            onAccepted: function() {
                console.log("Choose file: " + currentFile)
                text_id.text = currentFile
            }

            onRejected: function() {
                console.log("User rejected file")
            }
        }
    }
}
