import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle
    {
        id: rect_id
        height: 300
        width: height + 50
        color: "dodgerblue"

        property string description: "A rectangle to play with"

        onWidthChanged: {
            console.log("width changed to: " + rect_id.width)
        }

        onHeightChanged: {
            console.log("height changed to: " + rect_id.height)
        }

        onColorChanged: {}

        onDescriptionChanged: {
            console.log("description changed to: " + rect_id.description)
        }

        MouseArea
        {
            anchors.fill: parent

            onClicked: mouse => {
                rect_id.height += 20
                rect_id.description = "new data"
            }
        }
    }
}
