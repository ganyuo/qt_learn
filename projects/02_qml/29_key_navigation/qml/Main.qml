import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    /*
    Row
    {
        anchors.centerIn: parent

        Rectangle
        {
            id: first_rect_id
            width: 300
            height: 300
            border.color: "black"
            color: "red"
            focus: true

            onFocusChanged: {
                color = focus ? "red" : "gray";
            }

            Keys.onDigit5Pressed: {
                console.log("I am rect 1");
            }

            KeyNavigation.right: second_rect_id
        }

        Rectangle
        {
            id: second_rect_id
            width: 300
            height: 300
            border.color: "black"
            color: "gray"

            onFocusChanged: {
                color = focus ? "red" : "gray";
            }

            Keys.onDigit5Pressed: {
                console.log("I am rect 2");
            }

            KeyNavigation.left: first_rect_id
        }
    }
    */

    Grid {
        width: 100; height: 100
        columns: 2

        Rectangle {
            id: topLeft
            width: 50; height: 50
            color: focus ? "red" : "lightgray"
            focus: true

            KeyNavigation.right: topRight
            KeyNavigation.down: bottomLeft
        }

        Rectangle {
            id: topRight
            width: 50; height: 50
            color: focus ? "red" : "lightgray"

            KeyNavigation.left: topLeft
            KeyNavigation.down: bottomRight
        }

        Rectangle {
            id: bottomLeft
            width: 50; height: 50
            color: focus ? "red" : "lightgray"

            KeyNavigation.right: bottomRight
            KeyNavigation.up: topLeft
        }

        Rectangle {
            id: bottomRight
            width: 50; height: 50
            color: focus ? "red" : "lightgray"

            KeyNavigation.left: bottomLeft
            KeyNavigation.up: topRight
        }
    }
}
