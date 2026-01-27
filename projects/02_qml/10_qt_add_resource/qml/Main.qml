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

        Rectangle
        {
            color: "gray"
            anchors.fill: parent
        }

        Image
        {
            x: 10
            y: 50
            width: 100
            height: 100
            source: "qrc:/qml/images/滑稽.png"
            // source: "qml/images/滑稽.png"
        }
    }
}
