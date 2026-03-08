import QtQuick
import QtQml.XmlListModel

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    XmlListModel {
        id: xmlListModel_id
        source: "qrc:/xml/employees.xml"
        query: "/courses/course"

        XmlListModelRole {
            name: "instructor"
            elementName: "instructor"
        }
        XmlListModelRole {
            name: "year"
            elementName: "year"
        }
        XmlListModelRole {
            name: "coursename"
            elementName: "coursename"
        }
        XmlListModelRole {
            name: "hot"
            elementName: "coursename"
            attributeName: "hot"
        }
    }

    ListView {
        id: listView_id
        anchors.fill: parent
        model: xmlListModel_id
        delegate: Rectangle {
            width: parent.width
            height: 50
            color: "lightgreen"

            Row {
                spacing: 30
                Text {
                    text: instructor
                    font.pointSize: 20
                }
                Text {
                    text: coursename + "(" + year + ")"
                    font.pointSize: 20
                    font.bold: hot === "true" ? true : false
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    console.log("Clicked " + coursename)
                }
            }
        }
    }
}
