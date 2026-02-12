import QtQuick
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    GridLayout {
        id: grid_layout_id
        columns: 3
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft

    // RowLayout {
    //     anchors.fill: parent

    // ColumnLayout {
    //     anchors.fill: parent

        Rectangle {
            id: top_left_rect_id
            width: 70
            height: width
            color: "magenta"
            Text {
                anchors.centerIn: parent
                text: "1"
                font.pointSize: 20
            }

            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: 150
            Layout.maximumHeight: 150
        }

        Rectangle {
            id: top_center_rect_id
            width: 100
            height: width
            color: "yellowgreen"
            Text {
                anchors.centerIn: parent
                text: "2"
                font.pointSize: 20
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.columnSpan: 2;
        }

        // Rectangle {
        //     id: top_right_rect_id
        //     width: 100
        //     height: width
        //     color: "dodgerblue"
        //     Text {
        //         anchors.centerIn: parent
        //         text: "3"
        //         font.pointSize: 20
        //     }
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }

        Rectangle {
            id: center_left_rect_id
            width: 100
            height: width
            color: "red"
            Text {
                anchors.centerIn: parent
                text: "4"
                font.pointSize: 20
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rowSpan: 2;
        }

        Rectangle {
            id: center_center_rect_id
            width: 100
            height: width
            color: "green"
            Text {
                anchors.centerIn: parent
                text: "5"
                font.pointSize: 20
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Rectangle {
            id: center_right_rect_id
            width: 100
            height: width
            color: "blue"
            Text {
                anchors.centerIn: parent
                text: "6"
                font.pointSize: 20
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        // Rectangle {
        //     id: bottom_left_rect_id
        //     width: 100
        //     height: width
        //     color: "royalblue"
        //     Text {
        //         anchors.centerIn: parent
        //         text: "7"
        //         font.pointSize: 20
        //     }
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }

        Rectangle {
            id: bottom_center_rect_id
            width: 100
            height: width
            color: "yellow"
            Text {
                anchors.centerIn: parent
                text: "8"
                font.pointSize: 20
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Rectangle {
            id: bottom_right_rect_id
            width: 100
            height: width
            color: "pink"
            Text {
                anchors.centerIn: parent
                text: "9"
                font.pointSize: 20
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
