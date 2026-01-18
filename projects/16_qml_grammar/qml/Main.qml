import QtQuick

Window
{
    id: root;
    width: 1280;
    height: 720;
    visible: true;
    color: "#4A4A4A";

    Image
    {
        anchors.centerIn: parent;
        id: image;
        source: "file:///home/ganyuo/workspace/qt_learn/image/滑稽.png";
    }

    Text
    {
        color: 'white';
        width: root.width;
        horizontalAlignment: Text.AlignHCenter;
        y: image.y + image.height + 20;
        text: "滑稽";
    }
}
