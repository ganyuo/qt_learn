import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#EBEBEB"

        ListModel {
            id: listModel_id

            ListElement {
                our_color: "magenta"
            }
            ListElement {
                our_color: "yellowgreen"
            }
            ListElement {
                our_color: "dodgerblue"
            }
            ListElement {
                our_color: "red"
            }
            ListElement {
                our_color: "green"
            }
            ListElement {
                our_color: "blue"
            }
            ListElement {
                our_color: "lightgreen"
            }
            ListElement {
                our_color: "yellow"
            }
            ListElement {
                our_color: "pink"
            }
        }
    }

    Component {
        id: delegate_id
        Column {
            readonly property bool is_current: PathView.isCurrentItem
            opacity: is_current ? 1 : 0.3
            scale: PathView.scale
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 64
                height: width
                radius: 10
                color: our_color

                MouseArea {
                    anchors.fill: parent
                    onClicked: function() {
                        if (is_current) {
                            console.log("Clicked on " + model.our_color)
                        }
                        else {
                            console.log("Not the current item")
                        }
                    }
                }
            }
            Text {
                id: text_id
                text: our_color
                font.pointSize: 24
            }
        }
    }

    PathView {
        anchors.fill: parent
        // model: 100
        model: listModel_id
        delegate: delegate_id
        focus: true
        
        path: Path {
            startX: root_id.width * 0.5
            startY: root_id.height * 0.9

            PathAttribute {
                name: "scale"
                value: 1
            }
            PathCubic {
                x: root_id.width * 0.1
                y: root_id.height * 0.5
                control1X: root_id.width * 0.3
                control1Y: root_id.height
                control2X: 0
                control2Y: root_id.height * 0.7
            }
            PathAttribute {
                name: "scale"
                value: 0.5
            }
            PathCubic {
                x: root_id.width * 0.5
                y: root_id.height * 0.1
                control1X: 0
                control1Y: root_id.height * 0.3
                control2X: root_id.width * 0.3
                control2Y: 0
            }
            PathAttribute {
                name: "scale"
                value: 0.3
            }
            PathCubic {
                x: root_id.width * 0.9
                y: root_id.height * 0.5
                control1X: root_id.width * 0.7
                control1Y: 0
                control2X: root_id.width
                control2Y: root_id.height * 0.3
            }
            PathAttribute {
                name: "scale"
                value: 0.5
            }
            PathCubic {
                x: root_id.width * 0.5
                y: root_id.height * 0.9
                control1X: root_id.width
                control1Y: root_id.height * 0.7
                control2X: root_id.width * 0.7
                control2Y: root_id.height
            }
            PathAttribute {
                name: "scale"
                value: 1
            }
        }
        Keys.onLeftPressed: function() {
            decrementCurrentIndex()
        }
        Keys.onRightPressed: function() {
            incrementCurrentIndex()
        }
    }
}
