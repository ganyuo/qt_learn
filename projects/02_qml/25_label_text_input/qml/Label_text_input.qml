import QtQuick

Item
{
    id: root_id

    readonly property alias text: text_input_id.text
    property alias label: label_id.text
    property alias place_holder_text: place_holder_id.text

    signal editing_finished()

    Row
    {
        spacing: 10

        Rectangle
        {
            id: label_rect_id
            width: label_id.implicitWidth + 20
            height: label_id.implicitHeight + 20
            color: "dodgerblue"

            Text
            {
                id: label_id
                anchors.centerIn: parent
            }
        }

        Rectangle
        {
            id: text_input_rect_id
            color: "dodgerblue"
            width: place_holder_id.implicitWidth + text_input_id.implicitWidth + 20
            height: text_input_id.implicitHeight + 20

            Text
            {
                id: place_holder_id
                anchors.centerIn: parent
                anchors.fill: parent
                visible: !text_input_id.text && !text_input_id.inputMethodComposing
                verticalAlignment: Text.AlignVCenter
            }

            TextInput
            {
                id: text_input_id
                anchors.centerIn: parent
                anchors.fill: parent
                focus: true
                verticalAlignment: TextInput.AlignVCenter
            }
        }

        Component.onCompleted: {
            text_input_id.editingFinished.connect(root_id.editing_finished)
        }
    }
}