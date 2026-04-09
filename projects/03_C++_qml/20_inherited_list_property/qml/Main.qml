import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Inherited List Properties")
    FootBallTeam{
        id: team1Id
        title: "苏超苏州队"
        coatch: "米卢"
        captain: Striker{
                name: "队长"
                position: "守门员"
                playing: true
        }
        players: [
            Defender{
                name: "队员1"
                position: "前锋"
                playing: true
            },
            Striker{
                name: "队员2"
                position: "中锋"
                playing: true
            },
            Defender{
                name: "队员3"
                position: "后卫"
                playing: true
            },
            Striker{
                name: "队员4"
                position: "边卫"
                playing: true
            }

        ]
    }

    FootBallTeam{
        id: team2Id
        title: "苏超苏州队"
        coatch: "米卢"
        captain: Striker{
                name: "队长"
                position: "守门员"
                playing: true
        }
        // 类信息宏，将players设置为默认属性，这样qml中的数据列表外部就不用加Players了
        // Q_CLASSINFO("DefaultProperty", "players")
        // players: [
            Defender{
                name: "队员5"
                position: "前锋"
                playing: true
            }
            Striker{
                name: "队员6"
                position: "中锋"
                playing: true
            }
            Defender{
                name: "队员7"
                position: "后卫"
                playing: true
            }
            Striker{
                name: "队员8"
                position: "边卫"
                playing: true
            }

        // ]
    }


    ListView{
        anchors.fill: parent
        model: team2Id.players
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

