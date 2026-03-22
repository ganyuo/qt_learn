import QtQuick
import QtQuick.Dialogs
import QtCore

Window {
    id: root_id
    x: window_settings_id.x
    y: window_settings_id.y
    width: window_settings_id.width
    height: window_settings_id.height
    visible: true

    Rectangle {
        id: rect_id
        anchors.fill: parent
        color: colors_settings_id.rect_color

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                colorDialog_id.open()
            }

            ColorDialog {
                id: colorDialog_id
                title: "Choose rectangle color"
                onAccepted: function() {
                    rect_id.color = selectedColor
                }
                onRejected: function(){
                    console.log("Dialog reject")
                }
            }
        }
    }

    Settings {
        id: window_settings_id
        category: "window"
        property int x: 300
        property int y: 300
        property int width: 1280
        property int height: 720
    }

    Settings {
        id: colors_settings_id
        category: "colors"
        property color rect_color: "red"
    }

    Component.onDestruction: function() {
        window_settings_id.x = root_id.x
        window_settings_id.y = root_id.y
        window_settings_id.width = root_id.width
        window_settings_id.height = root_id.height

        colors_settings_id.rect_color = rect_id.color
    }
}
