import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    SwipeView {
        id: swipe_view_id
        anchors.fill: parent
        currentIndex: page_indicator_id.currentIndex
        anchors.bottomMargin: 20

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

        onCurrentIndexChanged: function() {
            console.log("currentIndex: " + currentIndex);
        }
    }

    PageIndicator {
        id: page_indicator_id
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        currentIndex: swipe_view_id.currentIndex
        interactive: true
        count: swipe_view_id.count
    }
}
