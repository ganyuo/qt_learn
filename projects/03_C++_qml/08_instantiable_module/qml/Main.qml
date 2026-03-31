import QtQuick
import QtQuick.Controls
import Movies_module

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Movie {
        id: movie_id
        title: "Titanic"
        main_character: "Leonardo"
    }

    Button {
        text: "Invoke created object"
        onClicked: function() {
            movie_id.title = "Fast and Furious"
            movie_id.main_character = "ganyu"
            console.log("New " + movie_id.title + " ," + movie_id.main_character)
        }
    }
}
