import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Connections {
        target: cpp_signal_sender
        function onCall_qml(parameter) {
            console.log("This is QML: oncall_qml get parameter: " + parameter)
        }

        function onCall_timer(value) {
            console.log("This is QML: oncall_timer get value: " + value)
        }
    }

    Button {
        text: "call_cpp_slot"
        onClicked: function() {
            cpp_signal_sender.cpp_slot()
        }
    }
}
