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

        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "wifi"
            checked: true
            onCheckedChanged: function() {
                if (checked) {
                    console.log("wifi switch is turned ON");
                } else {
                    console.log("wifi switch id turned OFF");
                }
            }
        }

        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "bluetooth"
        }

        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: false
            text: "NFC"
        }
    }
}
