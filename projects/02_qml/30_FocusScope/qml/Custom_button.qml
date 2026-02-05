import QtQuick

FocusScope
{
    width: container_rect_id.width
    height: container_rect_id.height
    property alias color: container_rect_id.color

    Rectangle
    {
        id: container_rect_id
        width: 300
        height: 50
        color: "lightgray"
        focus: true

        Text
        {
            id: text_id
            anchors.centerIn: parent
            text: "default"
        }

        Keys.onPressed: function(event)
        {
            switch (event.key)
            {
                case Qt.Key_1:
                {
                    console.log("pressed on key 1");
                    text_id.text = "pressed on key 1";
                    break;
                }
                case Qt.Key_2:
                {
                    console.log("pressed on key 2");
                    text_id.text = "pressed on key 2";
                    break;
                }
                default:
                {
                    console.log("pressed on key " + event.key);
                    text_id.text = "pressed on key " + event.key;
                }
            }
        }
    }
}