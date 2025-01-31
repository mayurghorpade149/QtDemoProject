import QtQuick 2.14
import QtQuick 2.2
import QtQuick.Controls 2.14
import MainWindowLib 1.0
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.0




ApplicationWindow {
    id: mainStack
    title: qsTr("StackView")
    width:1920
    height:1080
    visible: true




    MainWindow{
        id: formClassId

        function readFile(fileUrl) {

            console.log("Reading file: " + fileUrl)
        }


        //        function writeFile(fileUrl, content) {

        //                console.log("Writing to file: " + fileUrl)
        //                console.log("Content: " + content)
        //            }
    }


    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        // nameFilters: ".png"

        onAccepted: {
            formClassId.readTextFile(fileDialog.fileUrls)
            console.log("You chose: " + fileDialog.fileUrls)
            // formClassId.writeFile(fileDialog.fileUrls)
            console.log()
            fileDialog.close()

        }
        onRejected: {
            console.log("Canceled")
            fileDialog.close()
        }
        //        Component.onCompleted: visible = true
    }



    Rectangle{
        id: upperrec
        width: parent.width
        height: parent.height * 0.15
        color: "#656565"
        onFocusChanged: mainStackView.push("GridView.qml")

        StackView {
            id: mainStackView
            anchors.top: parent.bottom
//            initialItem: "GridView.qml"

        }


        Row {

            spacing: 30

            anchors{
                centerIn: parent
            }
            RoundButton {
                width: 120
                height: 50
                onClicked:{
                    mainStackView.pop()
                    mainStackView.push("loginpage.qml")
                    console.log("Button 1 clicked")
                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "LogIn"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }

            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50

                onClicked: {
                    mainStackView.pop();
                    mainStackView.push("SignUp.qml")
                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "SignUp"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }


            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50
                onClicked: fileDialog.open()
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "Browse"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }

            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50
                onClicked: {
                    mainStackView.pop()
                    mainStackView.push("UserFrom.qml")
                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "FormUI"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }

            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50

                onClicked:{
                    mainStackView.pop();
                    mainStackView.push("Listview.qml")
                    console.log("Button 5 clicked")

                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "ListView"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }

            }
            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50

                onClicked:{
                    mainStackView.pop();
                    mainStackView.push("GridView.qml")
                    console.log("Button 6 clicked")

                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "GridView"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }
            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50

                onClicked:{
                    mainStackView.push("ChartViewDesign.qml")
                    console.log("Button 8 clicked")

                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "Chart"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }
            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50

                onClicked:{
                    mainStackView.pop();
                    mainStackView.push("Conversion.qml")
                    console.log("Button 9 clicked")
                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "Convo"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }
            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50
                onClicked:{
                    mainStackView.push("Calculator.qml")
                    console.log("Calculator Open")
                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "Calc"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }
            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50

                onClicked:{
                    mainStackView.push("Mapview.qml")
                    console.log("Map Open")
                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "Maps"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }
            RoundButton {
                font.pixelSize: 20
                width: 120
                height: 50
                onClicked:{

                    mainStackView.push("osmmap.qml")

                    console.log("MapOpen")


                }
                background: Rectangle{
                    height: parent.height
                    width: parent.width
                    color: "#3C3C3C"
                    radius: 8
                }

                Text{
                    text: "Help"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
            }
        }
    }


//    Rectangle {
//        id:recinit
//        width:mainStack.width
//        height: mainStack.height * 0.8
//        color: "#656565"

//    }

}
