import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Call JS From C++")

    function qml_js_function(param) {
        console.log("QML会话， C++调用包含参数: " + param + " 返回一些东西")
        return "这是QML, 传递给C++，感谢调用。"
    }

    Button {
        id:mButton
        text:"使用C++调用QML函数"
        onClicked: {
            qml_js_caller.cpp_method("QML调用中...")
        }
    }
}
