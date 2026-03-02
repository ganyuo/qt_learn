import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ListView {
        id: listView_id
        anchors.fill: parent

        header: header_id
        footer: Rectangle {
            width: parent.width
            height: 50
            color: "dodgerblue"
        }
        highlight: Rectangle {
            width: parent.width
            color: "blue"
            radius: 15
            opacity: 0.1
            z: 3
        }

        model: [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "Sepetember",
            "October",
            "November",
            "December"
        ]
        // delegate: delegate_id
        delegate: Rectangle {
            id: rect_id
            width: parent.width
            height: 50
            color: "yellowgreen"
            radius: 15

            Text {
                id: text_id
                anchors.centerIn: parent
                font.pointSize: 20
                text: modelData
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: function() {
                    console.log("Click on: " + modelData)
                }

                onPositionChanged: function() {
                    listView_id.currentIndex = index
                }
            }
        }
    }

    Component {
        id: header_id
        Rectangle {
            id: header_rect_id
            width: parent.width
            height: 50
            color: "pink"

            Text {
                anchors.centerIn: parent
                text: "Months"
                font.pointSize: 20
            }
        }
    }
}
