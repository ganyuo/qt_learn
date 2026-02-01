
import QtQuick

Item
{
    id: root_id
    width: notifier_rect_id.width
    height: notifier_rect_id.height

    property int count: 0
    property alias rect_color: notifier_rect_id.color

    required property Receiver target
    onTargetChanged: {
        notify.connect(target.receive_info)
    }

    signal notify(int count)

    Rectangle
    {
        id: notifier_rect_id
        width: 200
        height: 200
        color: "red"

        Text
        {
            id: display_text_id
            anchors.centerIn: parent
            font.pointSize: 20
            text: root_id.count
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                root_id.count++;
                root_id.notify(root_id.count);
            }
        }
    }
}
