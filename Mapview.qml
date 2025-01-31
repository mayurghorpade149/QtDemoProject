import QtQuick 2.14
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.14
import QtLocation 5.6
import QtPositioning 5.6

Rectangle {
    id: signuppage
    border.color: "black"
    border.width: 6
    width: mainStack.width
    height: mainStack.height * 0.8
    color: "grey"
    visible: true

    property int currentMapType: 0

    Map {
           id: map
           anchors.fill: parent
           plugin: Plugin {
               id: normalMapPlugin
               name:"here"

               PluginParameter { name: "here.app_id"; value: "oBB4FivcP23m2UZQCj8K" }
               PluginParameter { name: "here.token"; value: "P-D8XRRGeVt0YphUuOImeA" }

           }
           center: QtPositioning.coordinate(21.0, 78.0)
           zoomLevel: 14
           onActiveMapTypeChanged: {
               if (map.activeMapType === MapType.NormalMap) {
                   currentMapType = 0;
               } else if (map.activeMapType === MapType.SatelliteMapDay) {
                   currentMapType = 1;
               } else if (map.activeMapType === MapType.TerrainMap) {
                   currentMapType = 2;
               }
           }
       }



    RowLayout {
        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: 10
        }

        Button {
            width:50
            height: 50
            text: "Normal"
            onClicked: {
                currentMapType = 0;
            }
        }

        Button {
            text: "Satellite"
            onClicked: {
                currentMapType = 1;

            }
        }

        Button {
            text: "Terrain"
            onClicked: {
//                currentMapType = 2;
                map.activeMapType = MapType.TerrainMap
            }
        }
    }
}

