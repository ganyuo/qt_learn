import QtQuick
import qt_quick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Attached Properties")

    Person {
        name: "陈好"
        age: 20

        Timer.running: false
        Timer.interval: 1500
        Timer.onTimerOut: function() {
            console.log("Timeout for person object")
        }
    }

    Rectangle{
        id: rectId
        width:200
        height:200
        color: "lightgray"

        Timer.running: true
        Timer.interval: 2000
        Timer.onTimerOut: function(){
            console.log("Timer out for Rectangle")
        }
    }
}
