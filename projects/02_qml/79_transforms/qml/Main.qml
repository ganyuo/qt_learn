import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Clickable_rect {
        id: rect1_id
        width: 100
        height: 100
        x: 50
        y: 100
        color: "red"
        onClicked: function() {
            x += 20
        }
    }
    Clickable_rect {
        id: rect2_id
        width: 100
        height: 100
        x: 250
        y: 100
        color: "green"
        transformOrigin: Item.BottomLeft
        onClicked: function() {
            rotation += 15
        }
    }
    Clickable_rect {
        id: rect3_id
        width: 100
        height: 100
        x: 450
        y: 100
        color: "blue"
        transformOrigin: Item.BottomLeft
        onClicked: function() {
            scale += 0.05
        }
    }
}
