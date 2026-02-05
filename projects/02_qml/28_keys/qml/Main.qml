import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle
    {
        id: container_rect_id
        anchors.centerIn: parent
        width: 300
        height: 100
        color: "dodgerblue"
        focus: true

        // Keys.onDigit5Pressed: function(event)
        // {
        //     if (event.modifiers == Qt.ControlModifier)
        //     {
        //         console.log("specific signal: pressed key 5 with ctrl");
        //     }
        //     else
        //     {
        //         console.log("specific signal: pressed key 5");
        //     }
        //     event.accepted = false;
        // }

        // Keys.onPressed: function(event)
        // {
        //     if (event.key === Qt.Key_5)
        //     {
        //         if (event.modifiers & Qt.ControlModifier)
        //         {
        //             console.log("general signal: pressed key 5 with ctrl");
        //         }
        //         else
        //         {
        //             console.log("general signal: pressed key 5");
        //         }
        //     }
        // }

        Keys.onReleased: function(event)
        {
            switch (event.key)
            {
                case Qt.Key_5:
                {
                    print("key 5 released");
                    break;
                }
                case Qt.Key_M:
                {
                    print(event.text + " released");
                    break;
                }
            }
        }
    }
}
