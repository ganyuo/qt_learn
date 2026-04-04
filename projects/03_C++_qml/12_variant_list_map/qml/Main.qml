import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    function array_object_fun(array, map) {
        console.log("---Printing array---")
        array.forEach(function(element){
            console.log("Array item: " + element)
        })

        console.log("---Printing map object---")
        for(var mKey in map) {
            console.log("Object["+mKey+"]: "+map[mKey])
        }
    }

    Button {
        id: button1Id
        text : "Pass data to Cpp"
        onClicked: {
            var arr = ['Africa', 'Asia', 'Europe', 'North America', 'Oceania', 'Antarctica']
            var map = {
                firstName:"John",
                lastName:"Doe",
                location:"Earth"
            }

            Cpp_class.pass_from_qml_to_cpp(arr, map)
        }
    }

    Button {
        id: button2Id
        text : "GetVariantListFrom Cpp"
        anchors.top: button1Id.bottom
        onClicked: {
            var data = Cpp_class.get_variant_list_from_cpp()
            data.forEach(function(element){
             console.log("Array item: " + element)
            })
        }
    }

    Button {
        id: button3Id
        text : "GetVariantMapFrom Cpp"
        anchors.top: button2Id.bottom
        onClicked: {
            var data = Cpp_class.get_variant_map_from_cpp()
            for (var mKey in data)
            {
                console.log("Map["+mKey+"]: " + data[mKey])
            }
        }
    }

    Button {
        id: button4Id
        text : "Trigger JSCall"
        anchors.top: button3Id.bottom
        onClicked: {
            Cpp_class.trigger_js_call();
        }
    }
}
