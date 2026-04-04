import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    ListModel {
        id: listModel_id

        ListElement {
            m_number: 1
            m_color: "magenta"
        }
        ListElement {
            m_number: 2
            m_color: "yellowgreen"
        }
        ListElement {
            m_number: 3
            m_color: "dodgerblue"
        }
        ListElement {
            m_number: 4
            m_color: "red"
        }
        ListElement {
            m_number: 5
            m_color: "green"
        }
        ListElement {
            m_number: 6
            m_color: "blue"
        }
        ListElement {
            m_number: 7
            m_color: "lightgreen"
        }
        ListElement {
            m_number: 8
            m_color: "yellow"
        }
        ListElement {
            m_number: 9
            m_color: "pink"
        }
    }

    GridView {
        id: gridView_id
        anchors.fill: parent
        model: listModel_id
        // flow: GridView.FlowTopToBottom
        // layoutDirection: Qt.RightToLeft
        delegate: Rectangle {
            width: 100
            height: width
            color: m_color

            Text {
                text: m_number
                anchors.centerIn: parent
                font.pointSize: 20
            }
        }
    }
}
