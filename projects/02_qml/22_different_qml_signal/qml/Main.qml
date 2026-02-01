import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    Notifier
    {
        id: notifier_id
        rect_color: "yellowgreen"
        anchors.left: parent.left
        // onNotify: function(count) {
        //     console.log("Received: " + count)
        // }
        target: receiver_id
    }

    Receiver
    {
        id: receiver_id
        rect_color: "dodgerblue"
        anchors.right: parent.right
    }

    // Component.onCompleted: {
    //     notifier_id.notify.connect(receive_id.receive_info)
    // }
}
