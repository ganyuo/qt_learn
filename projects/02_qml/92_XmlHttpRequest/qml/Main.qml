import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    function download_data(url) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("Headers received");
            }
            else if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    // console.log("Got the data from the server: " + xhr.responseText.toString());
                    textArea_id.text = xhr.responseText.toString()
                }
                else {
                    console.log("Something went wrong");
                }
            }
        };
        xhr.open("GET", url);
        xhr.send()
    }

    function download_data(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("Headers received");
            }
            else if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    // console.log("Got the data from the server: " + xhr.responseText.toString());
                    // textArea_id.text = xhr.responseText.toString()
                    callback(xhr.responseText.toString())
                }
                else {
                    callback(null);
                }
            }
        };
        xhr.open("GET", url);
        xhr.send()
    }

    TextArea {
        id: textArea_id
        anchors.fill: parent
        textFormat: TextArea.RichText
        text: "Click to download html data"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: function() {
            // root_id.download_data("https://www.qt.io");
            root_id.download_data("https://www.qt.io", function(respones) {
                if (respones) {
                    textArea_id.text = respones
                }
                else {
                    console.log("Something went wrong");
                }
            });
        }
    }
}