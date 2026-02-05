import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Column
    {
        spacing: 20
        anchors.centerIn: parent

        Custom_button
        {
            color: "yellow"
            focus: true
        }

        Custom_button
        {
            color: "green"
            // focus: true
        }
    }

}
