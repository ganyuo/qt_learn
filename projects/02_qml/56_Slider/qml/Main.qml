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

        Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            from: 1
            to: 100
            value: 40
            onValueChanged: function() {
                progressBar_id.value = value
            }
        }

        ProgressBar {
            id: progressBar_id;
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            from: 1
            to: 100
            value: 40
        }
    }
}
