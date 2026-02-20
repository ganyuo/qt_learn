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
            horizontalAlignment: Qt.AlignHCenter
            text: "Dial"
            font.pointSize: 15
        }

        Dial {
            Layout.alignment: Qt.AlignHCenter
            from: 1
            to: 100
            value: 50
            wrap: true

            onValueChanged: function() {
                console.log("current value: " + value);
            }
        }
    }
}
