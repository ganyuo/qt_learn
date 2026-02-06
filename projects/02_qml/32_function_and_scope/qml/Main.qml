import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    function min(a, b) : real {
        return Math.min(a, b);
    }

    Rectangle
    {
        id: rect_id
        width: root_id.min(500, 100)
        height: 100
        anchors.centerIn: parent
        color: "blue"

        function say_message()
        {
            console.log("hello world");
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: function() {
                rect_id.say_message()
            }
        }
    }

    // Component.onCompleted: {
    //     console.log("The minimum is " + min(100, 200));
    //     rect_id.say_message();
    // }
}
