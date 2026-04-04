import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Window {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Rest Client")

    Material.theme: Material.Dark  // 主题：Light/Dark/System（跟随系统）
    Material.primary: Material.Blue  // 主色调（导航栏、标题、按钮默认色）
    Material.accent: Material.Teal   // 强调色（选中状态、按钮点击色）
    Material.elevation: 2            // 全局阴影高度（0-24，值越大阴影越明显）

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        ListView{
                id: listviewId
                model: MyModel
                delegate:  Rectangle{
                    width: root.width
                    height: textId.implicitHeight + 30
                    color: "beige"
                    border.color: "yellowgreen"
                    radius: 5

                    Text{
                        width: parent.width
                        height: parent.height
                        id: textId
                        anchors.centerIn: parent
                        text: modelData
                        font.pointSize: 13
                        wrapMode: Text.WordWrap
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
            }



        Button {
            id: button1Id
            text: "Fetch"
            Layout.fillWidth: true
            onClicked: {
                Wrapper.fetchPosts()
            }
        }

        Button {
            id: button2Id
            text: "RemoveLast"
            Layout.fillWidth: true
            onClicked: {
                Wrapper.removeLast()
            }
        }
    }

}
