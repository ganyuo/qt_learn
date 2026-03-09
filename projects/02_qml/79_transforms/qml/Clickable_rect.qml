import QtQuick

Rectangle {
    id: root_id
    signal clicked
    MouseArea {
        anchors.fill: parent
        onClicked: function() {
            root_id.clicked()
        }
    }
}