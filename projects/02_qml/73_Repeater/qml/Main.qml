import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    // Column {
    //     Repeater {
    //         model: 10
    //         Rectangle {
    //             width: 100
    //             height: 40
    //             border.width: 1
    //             color: "lightgreen"
    //         }
    //     }
    // }


    // Column {
    //     Repeater {
    //         model: ["one", "two", "three"]
    //         // model: 10
    //         CheckBox {
    //             text: modelData
    //         }
    //     }
    // }


    Flickable {
        contentHeight: column_id.implicitHeight
        anchors.fill: parent

        Column {
            id: column_id
            anchors.fill: parent
            spacing: 2

            Repeater {
                model: ["Jan", "Feb", "March"]
                // model: 100
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "lightgreen"

                    Text {
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
    }
}
