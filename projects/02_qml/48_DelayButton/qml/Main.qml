import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ColumnLayout {
        width: parent.width
        spacing: 40

        Label {
            wrapMode: Label.Wrap
            Layout.fillWidth: true
            text: "delay button"
            font.pointSize: 15
        }

        DelayButton {
            property bool activated: false
            text: "delay button"
            Layout.fillWidth: true
            delay: 1000

            onPressed: function() {
                if (activated === true) {
                    console.log("button is clicked. carrying out the task");
                    activated = false;
                }
            }

            onActivated: function() {
                console.log("button activated");
                activated = true
            }

            onPressedChanged: function() {
                console.log(progress)
            }
        }
    }
}
