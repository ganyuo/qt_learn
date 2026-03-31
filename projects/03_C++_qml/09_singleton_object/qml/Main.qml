import QtQuick
import QtQuick.Controls
import qt_learn

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Button {
        text: "click"
        onClicked: function() {
            Singleton.do_something()
        }
    }
}
