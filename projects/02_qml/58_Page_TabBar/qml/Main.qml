import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Page {
        id: page_id
        anchors.fill: parent

        header: Rectangle {
            width: parent.width
            height: 50
            color: "yellowgreen"
            Text {
                text: "some header text"
                anchors.centerIn: parent
            }
        }

        SwipeView {
            id: swipe_view_id
            anchors.fill: parent

            Image {
                id: image1_id
                fillMode: Image.PreserveAspectFit
                source: "file:///home/ganyuo/workspace/qt_learn/image/滑稽.png"
            }
            Image {
                id: image2_id
                fillMode: Image.PreserveAspectFit
                source: "file:///home/ganyuo/workspace/qt_learn/image/background.jpg"
            }
            Label {
                id: label_id
                text: "page 3"
            }
        }

        footer: TabBar {
            id: tabBar_id
            currentIndex: swipe_view_id.currentIndex

            TabButton {
                text: "first"
            }
            TabButton {
                text: "second"
            }
            TabButton {
                text: "third"
            }
        }
    }
}
