import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true
    title: qsTr("QML Image")

    Item
    {
        id: container_item_id
        x: 50
        y: 50
        width: 400
        height: 200

        Image
        {
            x: 10
            y: 50
            width: 100
            height: 100
            source: "file:image/滑稽.png"
        }

        Image
        {
            x: 150
            y: 50
            width: 100
            height: 100
            source: "qrc:/images/滑稽.png"
        }

        Image
        {
            x: 300
            y: 50
            width: 100
            height: 100
            source: "file:///home/ganyuo/workspace/qt_learn/image/滑稽.png"
        }

        Image
        {
            x: 450
            y: 50
            width: 100
            height: 100
            source: "https://github.com/ganyuo/qt_learn/blob/master/image/%E6%BB%91%E7%A8%BD.png?raw=true"
        }
    }
}
