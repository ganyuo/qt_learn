import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ColumnLayout {
        anchors.fill: parent
        ListView {
            id: listView_id
            model: listModel_id
            delegate: delegate_id
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button {
            text: "add item"
            Layout.fillWidth: true
            onClicked: function() {
                listModel_id.append({
                    "names": "珐露珊",
                    "country": "须弥"
                })
            }
        }
        Button {
            text: "clear"
            Layout.fillWidth: true
            onClicked: function() {
                listModel_id.clear()
            }
        }
        Button {
            text: "delete item at index 2"
            Layout.fillWidth: true
            onClicked: function() {
                if (listModel_id.count > 2) {
                    listModel_id.remove(2, 1)
                } else {
                    console.log("Index is invalid")
                }
            }
        }
        Button {
            text: "set item at index 1"
            Layout.fillWidth: true
            onClicked: function() {
                listModel_id.set(1, {
                    "names": "芙宁娜",
                    "country": "枫丹"
                })
            }
        }
    }

    ListModel {
        id: listModel_id

        ListElement {
            names: "砂糖"
            country: "蒙德"
        }
        ListElement {
            names: "菲谢尔"
            country: "蒙德"
        }
        ListElement {
            names: "刻晴"
            country: "璃月"
        }
        ListElement {
            names: "甘雨"
            country: "璃月"
        }
        ListElement {
            names: "胡桃"
            country: "璃月"
        }
        ListElement {
            names: "香菱"
            country: "璃月"
        }
        ListElement {
            names: "神里绫华"
            country: "稻妻"
        }
        ListElement {
            names: "宵宫"
            country: "稻妻"
        }
    }

    Component {
        id: delegate_id

        Rectangle {
            id: rect_id
            width: parent.width
            height: 50
            color: "yellowgreen"
            radius: 15

            Text {
                id: text_id
                anchors.centerIn: parent
                font.pointSize: 20
                text: country + ": " + names
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    console.log("Click on " + country + ": " + names)
                }
            }
        }
    }
}
