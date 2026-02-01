import QtQuick

Item
{
    width: receiver_rect_id.width
    height: receiver_rect_id.height

    property alias rect_color: receiver_rect_id.color

    function receive_info(count) {
        display_text_id.text = count
    }

    Rectangle
    {
        id: receiver_rect_id
        width: 200
        height: 200
        color: "red"

        Text
        {
            id: display_text_id
            anchors.centerIn: parent
            font.pointSize: 20
            text: "0"
        }
    }
}