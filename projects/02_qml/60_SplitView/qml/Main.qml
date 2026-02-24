import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    SplitView {
        anchors.fill: parent
        // orientation: Qt.Horizontal
        orientation: Qt.Vertical

        Rectangle {
            id: rect1_id
            color: "lightblue"
            SplitView.preferredWidth: 100
            SplitView.preferredHeight: 100
            Text {
                text: "view1"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: rect2_id
            color: "lightgreen"
            SplitView.preferredWidth: 100
            SplitView.preferredHeight: 100
            SplitView.minimumWidth: 50
            Text {
                text: "view2"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: rect3_id
            color: "yellow"
            SplitView.preferredWidth: 100
            SplitView.preferredHeight: 100
            Text {
                text: "view3"
                anchors.centerIn: parent
            }
        }
    }
}
