import QtQuick
import qt_quick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Object List Properties")

    FootBallTeam{
        id: team1Id
        title: "苏超苏州队"
        coatch: "米卢"
        captain: Player{
                name: "队长"
                position: "守门员"
                playing: true
        }

        players: [
            Player{
                name: "队员1"
                position: "前锋"
                playing: true
            },
            Player{
                name: "队员2"
                position: "中锋"
                playing: true
            },
            Player{
                name: "队员3"
                position: "后卫"
                playing: true
            },
            Player{
                name: "队员4"
                position: "边卫"
                playing: true
            }

        ]
    }

    ListView{
        anchors.fill: parent
        model: team1Id.players
        delegate: Rectangle{
            width: parent.width
            height: 50
            border.width: 1
            border.color: "yellowgreen"
            color: "beige"
            radius: 10
            Text {
                id: textId
                text: qsTr(name)
                font.pointSize: 20
            }
        }
    }

    Component.onCompleted: function() {
        console.log("We have " + team1Id.players.length + " players in team " + team1Id.title)
    }
}
