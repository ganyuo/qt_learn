import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root_id
    width: 640
    height: 720
    visible: true

    header: ToolBar {
        height: 50
        // background: Rectangle {
        //     color: "mintcream"
        // }

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                background: Rectangle {
                    color: "mintcream"
                }
                icon.source: "qrc:/right.svg"

                onClicked: function() {
                    drawer_id.open();
                }
            }

            Label {
                id: title_label_id
                text: "drawer app"
                font.pointSize: 20
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    Drawer {
        id: drawer_id
        width: Math.min(parent.width, parent.height) * 2 / 3
        height: parent.height
        interactive: true

        ColumnLayout {
            spacing: 0
            width: parent.width

            Button {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 50
                text: "item1"
                font.pointSize: 20
                background: Rectangle {
                    color: "red"
                }
                Layout.fillWidth: true
                onClicked: function() {
                    console.log("Clicked on item1");
                    content_rect_id.color = "red"
                    drawer_id.close()
                }
            }
            Button {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 50
                text: "item2"
                font.pointSize: 20
                background: Rectangle {
                    color: "green"
                }
                Layout.fillWidth: true
                onClicked: function() {
                    console.log("Clicked on item2");
                    content_rect_id.color = "green"
                    drawer_id.close()
                }
            }
            Button {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 50
                text: "item3"
                font.pointSize: 20
                background: Rectangle {
                    color: "blue"
                }
                Layout.fillWidth: true
                onClicked: function() {
                    console.log("Clicked on item3");
                    content_rect_id.color = "blue"
                    drawer_id.close()
                }
            }
        }
    }

    Rectangle {
        id: content_rect_id
        anchors.fill: parent
        color: "gray"
    }
}
