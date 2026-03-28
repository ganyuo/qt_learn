import QtQuick
import QtQuick.Controls
// @type movie
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QProperty Mapping")

    Column{
        Text{
            id:title_id
            width:500
            text: movie === null?"":movie.title
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: main_character_id
            width:500
            text: qsTr(movie === null?"":movie.main_character)
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            TextField{
                id:titleTextFieldId
                width:300
            }

            Button{
                id:button1
                width:200
                text:qsTr("change title")
                onClicked: function(){
                    movie.title = titleTextFieldId.text
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            TextField{
                id:mainCharTextFieldId
                width:300
            }

            Button{
                id:button2
                width:200
                text:qsTr("change main character")
                onClicked: function(){
                    movie.main_character = mainCharTextFieldId.text

                }
            }
        }
    }


}
