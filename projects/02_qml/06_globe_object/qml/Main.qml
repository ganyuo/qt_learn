import QtQuick

Window
{
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("The Qt Globe Object")

    property var fonts: Qt.fontFamilies()

    Text
    {
        anchors.centerIn: parent
        color: Qt.rgba(1, 0, 0, 1)
        text: Qt.md5("hello world")
        font.pointSize: 20
    }

    Rectangle
    {
        id: click_able_rect
        width: 300
        height: 100
        color: "dodgerblue"
        anchors.bottom: parent.bottom

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                for (var i = 0; i < root.fonts.length; i++)
                {
                    console.log("[" + i + "]" + root.fonts[i])
                }

                var mText = "hello world"
                var mTextHash = Qt.md5(mText)
                console.log("The hash of the name is\: " + mTextHash)

                Qt.openUrlExternally("https\:\/\/ganyuo.github.io")
                Qt.openUrlExternally("file\:\/\/\/home/ganyuo/test.txt")

                console.log("The current platform is\: " + Qt.platform.os)

                // Qt.quit()
            }
        }
    }
}
