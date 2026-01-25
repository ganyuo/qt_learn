import QtQuick

Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text
    {
        anchors.centerIn: parent
        text: "hello world"
        color: "red"
        font.pointSize: 20
    }
}

