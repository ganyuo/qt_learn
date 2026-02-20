import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Frame {
        anchors.centerIn: parent

        ColumnLayout {
            Button {
                text: "Button1"
            }
            Button {
                text: "Button2"
            }
            Button {
                text: "Button3"
            }
        }
    }
}
