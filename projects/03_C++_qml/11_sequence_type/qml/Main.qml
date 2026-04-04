import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Cppclass {
        id: cppclass_id
    }

    Column {
        Button {
            text: "send arr"
            onClicked: function() {
                var arr = ["ganyu", "sugar", "hutao"]
                cppclass_id.qml_array_to_cpp(arr)
            }
        }

        Button {
            text: "receive arr"
            onClicked: function() {
                var arr = cppclass_id.retrieve_stings()
                console.log("receive array: " + arr)
                arr.forEach(function(elem) {
                    console.log("element: " + elem)
                })
            }
        }
    }

}
