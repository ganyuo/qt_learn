import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true
    title: qsTr("Property Change Handlers")

    property string name: "ganyuo"
    onNameChanged: {
        console.log("Name: " + name)
    }

    onTitleChanged: {
        console.log("New title: " + title)
    }

    Rectangle
    {
        id: click_able_rect
        width: 300
        height: 100
        color: "greenyellow"
        anchors.centerIn: parent

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                root_id.name = "Ciallo～(∠・ω< )⌒★!"
                root_id.title = "Ciallo～(∠・ω< )⌒★!"
            }
        }
    }

    Component.onCompleted: {
        console.log("Before any change - name:" + name)
    }
}
