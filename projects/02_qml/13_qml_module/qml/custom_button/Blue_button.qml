import QtQuick

Item
{
    id: root_id
    width: container_rect_id.width
    height: container_rect_id.height

    property alias button_text: button_text_id.text
    signal button_clicked

    Rectangle
    {
        id: container_rect_id
        width: button_text_id.implicitWidth + 10
        height: button_text_id.implicitHeight + 10
        color: "blue"
        border.color: "blue"
        border.width: 3

        Text
        {
            id: button_text_id
            text: "button"
            anchors.centerIn: parent
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                root_id.button_clicked() // 发出信号
            }
        }
    }

}
