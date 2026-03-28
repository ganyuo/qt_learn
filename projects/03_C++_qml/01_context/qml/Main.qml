import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column {
        spacing: 10
        anchors.left: parent.left

        Button {
            text: "regular_method"
            onClicked: function() {
                worker.regular_method()
            }
        }

        Button {
            text: "cpp_clot"
            onClicked: function() {
                worker.cpp_clot()
            }
        }

        Button {
            text: "regular_method_with_return"
            onClicked: function() {
                var ret = worker.regular_method_with_return("ganyuo", 3)
                console.log(ret)
            }
        }
    }

}
