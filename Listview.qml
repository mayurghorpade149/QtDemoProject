import QtQuick 2.14
import QtQuick.Controls 2.2
import MainWindowLib 1.0
Rectangle{
    width:mainStack.width
    height: mainStack.height * 0.8
    border.color: "black"
    border.width: 3
    color: "light grey"
    //    anchors.right: parent.right


    Text {
        id: s
        text: qsTr("ListView")
        font.italic: true
        font.pixelSize: 50
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle{
        id:signup
        width:parent.width*0.3
        height: parent.height*0.8
        border.color: "black"
        border.width: 3
        anchors.top:s.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        ListModel{
            id:citylistmodel
            ListElement{ name: "Nashik"}
            ListElement{ name: "Pune"}
            ListElement{ name: "Mumbai"}
            ListElement{ name: "Shimla"}
            ListElement{ name: "Goa"}
            ListElement{ name: "Banglore"}
            ListElement{ name: "Delhi"}
            ListElement{ name: "Jaipur"}
            ListElement{ name: "Bikaner"}
            ListElement{ name: "Ahemdabad"}
            ListElement{ name: "Jalander"}
            ListElement{ name: "Amritsar"}
        }
        ListView {
            id:list1
            width:parent.width*0.3
            height: parent.height*1.04
            model: citylistmodel
            delegate:Rectangle{
                width:signup.width
                height:list1.height*0.08
               color: list1.currentIndex === index ? "black" : "white"
                border.color: "white"
                border.width: 3
                Text {
                    id:s1
                    font.pixelSize: 25
                    font.italic: true
                    font.bold: true
                    text: qsTr(name)
                    anchors.centerIn: parent
                    color: list1.currentIndex === index ? "white" : "black"
                }
                MouseArea {
                anchors.fill: parent
                onClicked: {
                    list1.currentIndex = index
                    console.log(index)
                }
            }
            }
        }
    }
}
