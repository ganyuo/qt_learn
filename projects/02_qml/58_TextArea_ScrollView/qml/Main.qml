import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column {
        spacing: 40
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Text is a multi-line text editor."
        }

        ScrollView {
            id: scrollView_id
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 150

            TextArea {
                id: textArea_id
                font.pointSize: 15
                wrapMode: TextArea.WordWrap
                placeholderText: "Type in some text"
            }
        }

        Button {
            text: "submit"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function() {
                console.log("The text is: " + textArea_id.text)
            }
        }
    }
}
