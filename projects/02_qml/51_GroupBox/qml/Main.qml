import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column {
        spacing: 10
        anchors.fill: parent

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wraping around RadioButton"
        }

        GroupBox {
            title: "choose bonus"
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                spacing: 10
                RadioButton {
                    text: "coke"
                    onCheckedChanged: function() {
                        if (checked) {
                            console.log("coke button checked")
                        } else {
                            console.log("coke button not checked")
                        }
                    }
                }
                RadioButton {
                    text: "green tea"
                }
                RadioButton {
                    text: "ice cream"
                }
            }
        }

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wraping around CheckBox"
        }

        GroupBox {
            title: "Choose a Qt supported desktop platoform"
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                spacing: 10
                CheckBox {
                    text: "Windows"
                    onCheckedChanged: function() {
                        if (checked) {
                            console.log("Windows button checked")
                        } else {
                            console.log("Windows button not checked")
                        }
                    }
                }
                CheckBox {
                    text: "Mac"
                }
                CheckBox {
                    text: "Linux"
                }
            }
        }

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox that can enabled and disabled"
        }

        GroupBox {
            anchors.horizontalCenter: parent.horizontalCenter
            label: CheckBox {
                id: enable_check_id
                checked: true
                text: checked ? "disable" : "enable"
                onCheckableChanged: function() {
                    console.log("status: " + text + "d")
                }
            }
            Column {
                enabled: enable_check_id.checked
                spacing: 10
                CheckBox {
                    text: "Item1"
                }
                CheckBox {
                    text: "Item2"
                }
                CheckBox {
                    text: "Item3"
                }
            }
        }
    }
}
