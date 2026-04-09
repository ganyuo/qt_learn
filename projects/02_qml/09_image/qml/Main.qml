import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true
    title: qsTr("QML Image")

    Column
    {
        id: container_item_id
        anchors.fill: parent

        Text {
            text: "image1:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            height: 100
            source: "file:image/滑稽.png"
        }

        Text {
            text: "image2:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            height: 100
            source: "qrc:/images/滑稽.png"
        }

        Text {
            text: "image3:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            height: 100
            source: "file:///home/ganyuo/workspace/qt_learn/image/滑稽.png"
        }

        Text {
            text: "image4:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            height: 100
            source: "https://github.com/ganyuo/qt_learn/blob/master/image/%E6%BB%91%E7%A8%BD.png?raw=true"
        }
    }
}
