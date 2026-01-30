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
        height: 200
        width: 300
        color: "green"
    }

    Component.onCompleted: {
        console.log("Starting up...")
    }

    Component.onDestruction: {
        console.log("App is dying...")
    }
}
