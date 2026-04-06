import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Counter {
        id: counter_id
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Rectangle {
            width: 200
            height: 200
            radius: 10
            color: (counter_id.count >= 0) ? "green" : "red"

            Text {
                id: text_id
                text: counter_id.count
                anchors.centerIn: parent
                font.pointSize: 40
                color: "white"
            }
        }

        Button {
            width: 200
            text: "start"
            onClicked: function() {
                counter_id.count_start()
            }
        }

        Button {
            width: 200
            text: "stop"
            onClicked: function() {
                counter_id.count_stop()
            }
        }

        Button {
            width: 200
            text: "up"
            onClicked: function() {
                counter_id.up = true
            }
        }

        Button {
            width: 200
            text: "down"
            onClicked: function() {
                counter_id.up = false
            }
        }
    }
}
