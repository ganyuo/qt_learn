import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    TextEdit
    {
        width: 240
        text: "<b>Hello</b> <i>world!</i>"
        font.family: "Helvetica"
        font.pointSize: 20
        color: "blue"
        focus: true
        wrapMode: TextEdit.Wrap
        textFormat: TextEdit.RichText

        onEditingFinished: {
            console.log("The current text is: " + text)
        }
    }
}
