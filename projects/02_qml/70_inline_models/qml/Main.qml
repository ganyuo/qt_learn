import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ListView {
        id: listView_id
        anchors.fill: parent
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
                onClicked: function() {
                    console.log("Click on: " + modelData)
                }
            }
        }
    }
}
