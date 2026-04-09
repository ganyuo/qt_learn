import QtQuick
import qt_quick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Property value sources")

    Rectangle{
        id: rectId
        RandomNumber on width {
            maxValue: 300
        }
        RandomNumber on height {
            maxValue: 200
        }

        RandomNumber on radius {
            maxValue: 50
        }

        color:"dodgerblue"
    }
}
