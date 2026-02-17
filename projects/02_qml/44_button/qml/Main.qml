import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ColumnLayout {
        // anchors.fill: parent
        anchors.left: parent.left
        anchors.right: parent.right

        Button {
            id: button1
            text: "button1"
            Layout.fillWidth: true
            onClicked: function() {
                console.log("clicked on button1");
            }
        }
        
        Button {
            id: button2
            text: "button2"
            Layout.fillWidth: true
            onClicked: function() {
                console.log("clicked on button2");
            }
        }
    }
}
