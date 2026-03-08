import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    TableModel {
        id: tableModel_id

        TableModelColumn { display: "checked" }
        TableModelColumn { display: "amount" }
        TableModelColumn { display: "fruitType" }
        TableModelColumn { display: "fruitName" }
        TableModelColumn { display: "fruitPrice" }

        // Each row is one type of fruit that can be ordered
        rows: [
            {
                // Each property is one cell/column.
                checked: false,
                amount: 1,
                fruitType: "Apple",
                fruitName: "Granny Smith",
                fruitPrice: 1.50
            },
            {
                checked: true,
                amount: 4,
                fruitType: "Orange",
                fruitName: "Navel",
                fruitPrice: 2.50
            },
            {
                checked: false,
                amount: 1,
                fruitType: "Banana",
                fruitName: "Cavendish",
                fruitPrice: 3.50
            }
        ]
    }

    HorizontalHeaderView {
        id: horizontalHeaderView_id
        anchors.top: parent.top
        anchors.left: tableView_id.left
        syncView: tableView_id
        model: ["One", "Two", "Three", "Four", "Five"]
    }

    VerticalHeaderView {
        id: verticalHeaderView_id
        anchors.top: tableView_id.top
        anchors.left: parent.left
        syncView: tableView_id
    }

    TableView {
        id: tableView_id
        // anchors.fill: parent
        anchors.left: verticalHeaderView_id.right
        anchors.top: horizontalHeaderView_id.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        columnSpacing: 1
        rowSpacing: 1
        model: tableModel_id
        // delegate: TextInput {
        //     text: model.display
        //     padding: 12
        //     onAccepted: function() {
        //         model.display = text
        //     }
        //     Rectangle {
        //         anchors.fill: parent
        //         color: "#EFEFEF"
        //         z: -1
        //     }
        // }
        delegate: DelegateChooser {
            DelegateChoice {
                column: 0
                delegate: CheckBox {
                    checked: model.display
                    onToggled: function() {
                        model.display = checked
                    }
                }
            }
            DelegateChoice {
                column: 1
                delegate: SpinBox {
                    value: model.display
                    onValueModified: function() {
                        model.display = value
                    }
                }
            }
            DelegateChoice {
                delegate: TextField {
                    text: model.display
                    implicitWidth: 140
                    onAccepted: function() {
                        model.display = text
                    }
                }
            }
        }
    }

    Button {
        text: "Show the data"
        anchors.bottom: parent.bottom
        onClicked: function() {
            console.log(tableModel_id.data(tableModel_id.index(0, 0), "display"))
        }
    }
}
