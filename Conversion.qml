import QtQuick 2.14
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.14
import MainWindowLib 1.0
Rectangle{
    width:mainStack.width
    height: mainStack.height * 0.8
    property bool isHighlight: true
    MainWindow{
        id:conv1
    }
    Rectangle{
        id:signup
        width:parent.width*0.6
        height: parent.height*0.9
        anchors.centerIn:parent
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset:0
            verticalOffset:0
            color: "grey"
            spread:0.3
            radius:10
        }
        Text {
            id:dist1
            anchors.bottom: combodistance.top
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.bottomMargin: 10
            font.pixelSize: 22
            font.bold: true
            color: "#00bfff"
            text: qsTr("Distance")
        }
        ComboBox {
            id:combodistance
            width:parent.width*0.2
            height:parent.height*0.1
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 80
            editable: true
            currentIndex: 0
            displayText: currentText
            model: ListModel {
                id: model1
                ListElement { text: "Meter" }
                ListElement { text: "Feet" }
            }

            delegate: ItemDelegate {
                id: itemDel
                width: combodistance.width
                   contentItem: Text {
                    text: modelData
                    font.pixelSize: 18
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: combodistance.highlightedIndex === index
}


            indicator: Canvas {
                id: canvas
                x: combodistance.width - width - combodistance.rightPadding
                y: combodistance.topPadding + (combodistance.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: combodistance
                    function onPressedChanged() { canvas.requestPaint(); }
                }

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = combodistance.pressed ? "#00bfff" : "#1e90ff";
                    context.fill();
                }
            }

            contentItem:
                Text {
                leftPadding: combodistance.indicator.width + combodistance.spacing-1
                rightPadding: combodistance.indicator.width + combodistance.spacing
                text: combodistance.displayText
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
            popup: Popup {
                id:pop
                y: combodistance.height - 1
                width: combodistance.width
                implicitHeight: contentItem.implicitHeight
                padding: 1
                contentItem: ListView {
                    id:s
                    clip: true
                    implicitHeight: contentHeight
                    model: combodistance.popup.visible ? combodistance.delegateModel : null
                    currentIndex: combodistance.highlightedIndex
                    ScrollIndicator.vertical: ScrollIndicator { }
                }

                background: Rectangle {
                    radius: 2
                }
            }

        }
        Text {
            id:are1
            anchors.bottom: comboarea.top
            anchors.left: combodistance.right
            anchors.leftMargin: 130
            anchors.bottomMargin: 10
            font.pixelSize: 22
            font.bold: true
            color: "#00bfff"
            text: qsTr("Area")
        }
        ComboBox {
            id:comboarea
            width:combodistance.width
            height:combodistance.height
            anchors.left: combodistance.right
            anchors.leftMargin: 130
            anchors.top: parent.top
            anchors.topMargin: 80
            editable: true
            currentIndex: 0
            displayText: currentText
            model: ListModel {
                id: model2
                ListElement { text: "Sqr.Meter" }
                ListElement { text: "Sqr.Feet" }
            }
            delegate: ItemDelegate {
                width: comboarea.width
                contentItem: Text {
                    text: modelData
                    font.pixelSize: 18
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: comboarea.highlightedIndex === index
            }
            indicator: Canvas {
                id: canvas1
                x: comboarea.width - width - comboarea.rightPadding
                y: comboarea.topPadding + (comboarea.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"
                Connections {
                    target: comboarea
                    function onPressedChanged() { canvas1.requestPaint(); }
                }
                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = comboarea.pressed ? "#00bfff" : "#1e90ff";
                    context.fill();
                }
            }
            contentItem: Text {
                leftPadding: comboarea.indicator.width + comboarea.spacing-1
                rightPadding: comboarea.indicator.width + comboarea.spacing

                text: comboarea.displayText
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
            popup: Popup {
                y: comboarea.height - 1
                width: comboarea.width
                implicitHeight: contentItem.implicitHeight
                padding: 1
                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: comboarea.popup.visible ? comboarea.delegateModel : null
                    currentIndex: comboarea.highlightedIndex
                    ScrollIndicator.vertical: ScrollIndicator { }
                }
                background: Rectangle {
                    radius: 2
                }
            }
        }
        Text {
            id:temp1
            anchors.bottom: combotemper.top
            anchors.left: comboarea.right
            anchors.leftMargin: 130
            anchors.bottomMargin: 10
            font.pixelSize: 22
            font.bold: true
            color: "#00bfff"
            text: qsTr("Temperature")
        }
        ComboBox {
            id:combotemper
            width:comboarea.width
            height:comboarea.height
            anchors.left: comboarea.right
            anchors.leftMargin: 130
            anchors.top: parent.top
            anchors.topMargin: 80
            editable: true
            currentIndex: 0
            displayText: currentText
            model: ListModel {
                id: model3
                ListElement { text: "Celcius" }
                ListElement { text: "Fahrenheit" }
            }
            delegate: ItemDelegate {
                width: combotemper.width
                contentItem: Text {
                    text: modelData
                    font.pixelSize: 18
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: combotemper.highlightedIndex === index
            }

            indicator: Canvas {
                id: canvas2
                x: combotemper.width - width - combotemper.rightPadding
                y: combotemper.topPadding + (combotemper.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: combotemper
                    function onPressedChanged() { canvas2.requestPaint(); }
                }
                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = comboarea.pressed ? "#00bfff" : "#1e90ff";
                    context.fill();
                }
            }
            contentItem: Text {
                leftPadding: combotemper.indicator.width + combotemper.spacing-1
                rightPadding: combotemper.indicator.width + combotemper.spacing
                text: combotemper.displayText
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
            popup: Popup {
                y: combotemper.height - 1
                width: combotemper.width
                implicitHeight: contentItem.implicitHeight
                padding: 1
                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: combotemper.popup.visible ? combotemper.delegateModel : null
                    currentIndex: combotemper.highlightedIndex
                    ScrollIndicator.vertical: ScrollIndicator { }
                }

                background: Rectangle {
                    radius: 2
                }
            }
        }

        TextField{
            id:aretxt
            width:parent.width*0.2
            height:parent.height*0.12
            font.pixelSize: 20
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top:combodistance.bottom
            anchors.topMargin: 80
            placeholderText: qsTr("meter")
            background:  Rectangle{
                id:ad
                width:parent.width
                height:parent.height
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
        }
        TextField{
            id:distxt
            width:combodistance.width
            height:combodistance.height
            font.pixelSize: 20
            anchors.left: aretxt.right
            anchors.leftMargin: 130
            anchors.top:comboarea.bottom
            anchors.topMargin: 80
            placeholderText: qsTr("Sq.meter")
            topPadding: 20
            background:  Rectangle{
                id:da1
                width:combodistance.width
                height:combodistance.height+14
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
        }
        TextField{
            id:temptxt
            width:comboarea.width
            height:comboarea.height
            font.pixelSize: 20
            anchors.left: distxt.right
            anchors.leftMargin: 130
            anchors.top:combotemper.bottom
            anchors.topMargin: 80
            placeholderText: qsTr("celcius")
            topPadding: 20
            background:  Rectangle{
                id:ta1
                width:comboarea.width
                height:comboarea.height+14
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
        }
        TextField{
            id:aretxt2
            width:aretxt.width
            height:aretxt.height
            font.pixelSize: 20
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top:aretxt.bottom
            anchors.topMargin: 70
            placeholderText: qsTr("feet")
            enabled: false
            background:  Rectangle{
                id:ad14
                width:parent.width
                height:parent.height
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
        }
        TextField{
            id:distxt2
            width:combodistance.width
            height:combodistance.height
            font.pixelSize: 20
            anchors.left: aretxt.right
            anchors.leftMargin: 130
            anchors.top:distxt.bottom
            anchors.topMargin: 80
            placeholderText: qsTr("Sq.feet")
            topPadding: 20
            enabled: false
            background:  Rectangle{
                id:da14
                width:combodistance.width
                height:combodistance.height+14
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
        }
        TextField{
            id:temptxt2
            width:comboarea.width
            height:comboarea.height
            font.pixelSize: 20
            anchors.left: distxt.right
            anchors.leftMargin: 130
            anchors.top:temptxt.bottom
            anchors.topMargin: 80
            placeholderText: qsTr("fahrenhiet")
            topPadding: 20
            enabled: false
            background:  Rectangle{
                id:ta14
                width:comboarea.width
                height:comboarea.height+14
                radius: 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset:0
                    verticalOffset:0
                    color: "grey"
                    spread:0.08
                    radius:8
                }
            }
        }
        Button{
            id:update1
            width:parent.width*0.2
            height: parent.height*0.1
            anchors.top:comboarea.bottom
            anchors.topMargin: 400
            anchors.horizontalCenter: comboarea.horizontalCenter
            background: Rectangle{
                id:rec6
                anchors.fill: parent
                radius:20
                color: update1.pressed ? "#1e90ff" : "#00bfff"
                Text {
                    id: name5
                    anchors.centerIn: parent
                    text: qsTr("update")
                    font.pixelSize: 22
                    font.bold: true
                    color: "white"
                }
            }
            onClicked: {
                console.log("updated")
               var dis = conv1.convertValue(aretxt.text,combodistance.currentIndex)
                aretxt2.text=dis
                console.log("updated distance", dis)
                var Area =conv1.convertareaValue(distxt.text,comboarea.currentIndex)
                 distxt2.text=Area
                console.log("updated area", Area)
                var Temp =conv1.convertTempValue(temptxt.text,combotemper.currentIndex)
                 temptxt2.text=Temp
                console.log("updated Temperature", Temp)
            }
        }
    }

}
