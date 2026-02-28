import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ListView {
        id: listView_id
        anchors.fill: parent
        model: model_id
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
                text: country + ": " + capital
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    console.log("Click on " + country + ": " + capital)
                }
            }
        }
    }

    ListModel {
        id: model_id

        ListElement {
            country: "Rwanda"
            capital: "Kigali"
        }
        ListElement {
            country: "Kenya"
            capital: "Nairobi"
        }
        ListElement {
            country: "Germany"
            capital: "Berlin"
        }
        ListElement {
            country: "India"
            capital: "Numbai"
        }
    }

    Component {
        id: delegate_id

        Rectangle {
            id: rect_id
            width: parent.width
            height: 50
            color: "yellowgreen"
            radius: 15

            Text {
                id: text_id
                anchors.centerIn: parent
                font.pointSize: 20
                text: country + ": " + capital
            }
        }
    }
}
