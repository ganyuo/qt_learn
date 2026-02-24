import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column {
        spacing: 30
        anchors.centerIn: parent

        Row {
            spacing: 30
            width: 300

            Label {
                id: label_id
                width: 100
                height: 50
                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                text: "First name: "
            }

            TextField {
                id: textField_id
                width: parent.width - label_id.width
                height: 50
                placeholderText: "Type in your name"
                onEditingFinished: function() {
                    console.log("Current text: " + text)
                }
            }
        }

        Button {
            text: "click"
            onClicked: function() {
                console.log("Text: " + textField_id.text)
            }
        }
    }
}
