import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ColumnLayout {
        width: parent.width
        height: parent.height

        Label {
            text: "non editable combo"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }

        ComboBox {
            id: non_editable_combo_id
            model: ["one", "two", "three", "four"]
            Layout.fillWidth: true
            onActivated: function() {
                console.log("[" + currentIndex + "] " + currentText + "is activated")
            }
        }

        Label {
            text: "editable combo"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }

        ComboBox {
            id: editable_combo_id
            editable: true
            textRole: "text"
            // textRole: "location"
            // textRole: "favorite_food"
            Layout.fillWidth: true
            model: ListModel {
                id: model
                ListElement {
                    text: "dog"
                    location: "kigali"
                    favorite_food: "meet"
                }
                ListElement {
                    text: "chicken"
                    location: "nairobi"
                    favorite_food: "rice"
                }
                ListElement {
                    text: "cat"
                    location: "mumbai"
                    favorite_food: "fish"
                }
            }

            onAccepted: function() {
                if (find(editText) === -1) {
                    model.append({text: editText, location: "US", favorite_food: "apple"})
                }
            }

            onActivated: function() {
                console.log("[" + currentIndex + "] " + currentText + "is activated")
            }
        }
        Button {
            text: "captrue current element"
            Layout.fillWidth: true
            onClicked: function() {
                console.log(model.get(editable_combo_id.currentIndex).text + ", " + model.get(editable_combo_id.currentIndex).location)
            }
        }
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
