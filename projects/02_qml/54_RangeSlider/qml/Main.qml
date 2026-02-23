import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    RangeSlider {
        anchors.centerIn: parent
        from: 1
        to: 100
        first.value: 25
        second.value: 75

        first.onValueChanged: function() {
            console.log("first value changed to " + first.value);
        }

        second.onValueChanged: function() {
            console.log("second value changed to " + second.value);
        }
    }
}
