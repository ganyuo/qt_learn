import QtQuick
import QtQuick.Dialogs
import QtQuick.LocalStorage
import "database.js" as Db_js

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    property var db;

    Rectangle {
        id: rect_id
        anchors.fill: parent
        color: "red"

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

    Component.onCompleted: function() {
        Db_js.dbInit()
        Db_js.readData()
    }

    Component.onDestruction: function() {
        Db_js.storeData()
    }
}
