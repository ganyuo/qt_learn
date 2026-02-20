import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ColumnLayout {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter

        CheckBox {
            text: "option1"
            checked: true
            onCheckedChanged: function() {
                if (checked) {
                    console.log("option1 is checked")
                } else {
                    console.log("option1 is unchecked")
                }
            }
        }

        CheckBox {
            text: "option2"
        }

        CheckBox {
            text: "option3"
            checked: true
            enabled: false
        }
    }

}
