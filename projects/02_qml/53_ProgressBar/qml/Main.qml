import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column {
        width: parent.width
        spacing: 20

        Button {
            text: "start"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                progressBar1_id.value = 75
            }
        }

        Dial {
            id: dial_id
            from: 1
            to: 100
            value: 40
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: function() {
                progressBar_id.value = value
            }
        }

        ProgressBar {
            id: progressBar_id
            from: 1
            to: 100
            value: 40
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: function() {
                console.log("Current value: " + visualPosition)
            }
        }

        ProgressBar {
            id: progressBar1_id
            from: 1
            to: 100
            value: 40
            indeterminate: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
