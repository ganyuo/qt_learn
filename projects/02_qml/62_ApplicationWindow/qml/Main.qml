import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root_id
    width: 1280
    height: 720
    visible: true

    menuBar: MenuBar {
        Menu {
            title: "File"
            Action {
                id: new_action_id
                text: "New"
                icon.source: "qrc:/icon/new_file.svg"
                onTriggered: function() {
                    console.log("Clicked on new")
                }
            }
            Action {
                id: open_action_id
                text: "Open"
                icon.source: "qrc:/icon/open_file.svg"
            }
            Action {
                id: save_action_id
                text: "Save"
                icon.source: "qrc:/icon/save_file.svg"
            }
            MenuSeparator{
            }
            Action {
                id: quit_action_id
                text: "Quit"
                onTriggered: function() {
                    Qt.quit()
                }
            }
        }
        Menu {
            title: "Edit"
            Action {
                id: cut_action_id
                text: "Cut"
            }
            Action {
                text: "Copy"
            }
            Action {
                text: "Paste"
            }
            MenuSeparator{
            }
            Action {
                text: "Undo"
            }
            Action {
                text: "Redo"
            }
        }

        Menu {
            title: "Help"
            Action {
                id: help_action_id
                text: "Help"
            }
        }
    }

    header: ToolBar {
        Row {
            anchors.fill: parent
            ToolButton {
                action: new_action_id
            }
            ToolButton {
                action: save_action_id
            }
            ToolButton {
                action: quit_action_id
            }
            ToolButton {
                action: help_action_id
            }
        }
    }

    StackView {
        id: stackView_id
        anchors.fill: parent
        initialItem: Page1 {
        }
    }

    footer: TabBar {
        id: tab_bar_id
        width: parent.width

        TabButton {
            text: "Page1"
            onClicked: function() {
                stackView_id.pop()
                stackView_id.push("Page1.qml")
                console.log("Number of stack items: " + stackView_id.depth)
            }
        }
        TabButton {
            text: "Page2"
            onClicked: function() {
                stackView_id.pop()
                stackView_id.push("Page2.qml")
                console.log("Number of stack items: " + stackView_id.depth)
            }
        }
        TabButton {
            text: "Page3"
            onClicked: function() {
                stackView_id.pop()
                stackView_id.push("Page3.qml")
                console.log("Number of stack items: " + stackView_id.depth)
            }
        }
    }
}
