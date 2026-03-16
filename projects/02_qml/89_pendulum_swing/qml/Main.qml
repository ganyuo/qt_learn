import QtQuick

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    readonly property int pendulum_angle: 30
    readonly property int animation_duration: 700

    Rectangle {
        id: pendulum_id
        width: 20
        height: 200
        color: "black"
        x: (parent.width - width) / 2
        y: 50
        transformOrigin: Item.Top

        Rectangle {
            id: bob_id
            width: 50
            height: 50
            color: "red"
            radius: width / 2
            x: (parent.width - width) / 2
            y: parent.height
            transformOrigin: Item.Bottom
            rotation: pendulum_id.rotation
        }

        SequentialAnimation {
            loops: Animation.Infinite
            running: true
            NumberAnimation {
                id: left_to_right_id
                target: pendulum_id
                property: "rotation"
                from: -root_id.pendulum_angle
                to: root_id.pendulum_angle
                easing.type: Easing.InOutQuad
                duration: root_id.animation_duration
            }
            NumberAnimation {
                id: right_to_left_id
                target: pendulum_id
                property: "rotation"
                from: root_id.pendulum_angle
                to: -root_id.pendulum_angle
                easing.type: Easing.InOutQuad
                duration: root_id.animation_duration
            }
        }
    }

}
