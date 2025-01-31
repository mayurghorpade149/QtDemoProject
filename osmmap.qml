import QtQuick 2.14
import QtQuick.Controls 2.2
import QtLocation 5.14
import QtPositioning 5.14
import MainWindowLib 1.0
Rectangle{
    width:mainStack.width
    height: mainStack.height * 0.8
    border.color: "black"
    border.width: 3
    Plugin {
            id: mapPlugin
            name: "osm" // Use the OSM plugin
        }
    Map {
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(37.7749, -122.4194) // San Francisco coordinates
            zoomLevel: 12
        }

    Control {
        id: controls
        width: parent.width
        height: 40

        Button {
            text: "+"
            onClicked: map.zoomIn()
        }

        Button {
            text: "-"
            onClicked: map.zoomOut()
        }
    }
}
