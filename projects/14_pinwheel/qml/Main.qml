import QtQuick

Window {
    width: 720;
    height: 480;
    visible: true;
    title: qsTr("pinwheel");

    Image {
        anchors.fill: parent;
        id: background;
        source: "file:///home/ganyuo/workspace/qt_learn/image/background.jpg";

        Image {
            anchors.centerIn: parent;
            id: pinwheel;
            height: parent.height * 0.5;
            width: parent.width * 0.3;
            source: "file:///home/ganyuo/workspace/qt_learn/image/滑稽.png";

            Behavior on rotation {
                NumberAnimation {
                    duration: 500
                }
            }
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: pinwheel.rotation += 360;
        }
    }
}

