import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

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

    ListView {
        id: listView_id
        anchors.fill: parent
        model: listModel_id
        // delegate: delegate_id
        delegate: delegate_id
        section {
            property: "country"
            criteria: ViewSection.FullString
            delegate: Rectangle {
                id: section_rect_id
                width: parent.width
                height: 50
                color: "pink"
                radius: 14

                Text {
                    id: section_text_id
                    text: section
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: function() {
                        console.log("Clicked on: " + section)
                    }
                }
            }
        }
    }

    Component {
        id: delegate_id

        Rectangle {
            id: rect_id
            width: parent.width
            height: 50
            color: "beige"
            radius: 15

            Text {
                id: text_id
                anchors.centerIn: parent
                font.pointSize: 20
                text: names
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    console.log("Click on " + names)
                }
            }
        }
    }
}
