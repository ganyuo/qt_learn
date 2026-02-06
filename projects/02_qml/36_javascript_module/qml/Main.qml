import QtQuick
import "utils.mjs" as Utils

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Rectangle
    {
        id: rect_id
        width: 300
        height: 120
        color: "green"
        anchors.centerIn: parent

        Text
        {
            text: "click me"
            anchors.centerIn: parent
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                // console.log("the ages yield: " + Utils.combine_ages(33, 17));
                // value = Utils.add(33, 17);
                console.log("the ages yield: " + Utils.combine_ages(33, 17));
                console.log("the ages difference: " + Utils.ages_diff(33, 17));
                console.log("the ages yield: " + Utils.add(33, 17));
            }
        }
    }
}
