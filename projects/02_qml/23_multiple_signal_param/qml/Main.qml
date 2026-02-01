import QtQuick

Window
{
    id: root_id
    width: 1280
    height: 720
    visible: true

    signal info(string last_name, string first_name, string age)

    // onInfo: function(l, f, a) {
    //     print("last name: " + l + ", first name: " + f + ", age: " + a)
    // }

    // onInfo: function(l, f) {
    //     print("last name: " + l + ", first name: " + f)
    // }

    // onInfo: function(f, a) {
    //     print("first name: " + f + ", age: " + a)
    // }

    // onInfo: function(_, f, a) {
    //     print("first name: " + f + ", age: " + a)
    // }

    onInfo: function(_, _, a) {
        print("age: " + a)
    }

    Rectangle
    {
        id: rect_id
        width: 300
        height: 200
        color: "dodgerblue"

        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                root_id.info("snow", "john", 33)
            }
        }
    }

}
