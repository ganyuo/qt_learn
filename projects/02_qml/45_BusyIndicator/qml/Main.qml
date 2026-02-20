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

        BusyIndicator {
            id: busy_indicator_id
            running: false
            visible: false
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            id: running_button_id
            text: "runnung"
            Layout.fillWidth: true
            onClicked: {
                busy_indicator_id.running = true
                busy_indicator_id.visible = true
            }
        }

        Button {
            id: not_running_button_id
            text: "not_running"
            Layout.fillWidth: true
            onClicked: {
                busy_indicator_id.running = false
                busy_indicator_id.visible = false
            }
        }
    }

}
