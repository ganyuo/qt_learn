import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    function download_data(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("Headers received");
            }
            else if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    console.log("Got the data from the server: " + xhr.responseText.toString());
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

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        ListModel {
            id: listModel_id
        }

        ListView {
            id: listView_id
            model: listModel_id
            Layout.fillWidth: true
            Layout.fillHeight: true
            delegate: Rectangle {
                id: rectangle_id
                width: parent.width
                height: text_id.implicitHeight + 30

                Text {
                    id: text_id
                    anchors.centerIn: parent
                    text: userdata
                    font.pointSize: 13
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        Button {
            id: button_id
            Layout.fillWidth: true
            text: "Fecth"

            onClicked: function() {
                listModel_id.clear()
                root_id.download_data("https://jsonplaceholder.typicode.com/users", function(response) {
                    if (response)
                    {
                        var object = JSON.parse(response);
                        object.forEach(function(userdata){
                            listModel_id.append({
                                "userdata": userdata.name
                            })
                        });
                    }
                    else {
                        console.log("Something went wrong")
                    }
                });
            }
        }
    }
}
