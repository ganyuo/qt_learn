import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    property string value: "Clicked %1 times, double is %2"
    property int click_count: 0

    Cppclass {
        id: cppclass_id

        onSend_time: function(time) {
            console.log("Received: " + time + ", type is : " + typeof time)
        }
        onSend_date_time: function(date_time) {
            console.log("Received: " + date_time + ", type is : " + typeof date_time)
        }
    }

    Button {
        id: button_id
        text: "click"
        onClicked: function() {
            cppclass_id.cpp_slot()
            var date = new Date()
            cppclass_id.time_slot(date)
            cppclass_id.data_time_slot(date)

            click_count++
            button_id.text = value.arg(click_count).arg(click_count * 2)
        }
    }
}
