import QtQuick 2.14
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14
import Qt.labs.settings 1.0
import MainWindowLib 1.0

Rectangle {
    id:gridrec
   // border.color: "blue"
   // border.width: 4
    width:mainStack.width
    height: mainStack.height * 0.8
    color: "#656565"
    property int cellSize: 220
    property int selectedItemIndex: -1
    visible:true

    MainWindow{
        id: textCls
    }

    Text {
           id: selectedIndexText
           text: gridrec.selectedItemIndex !== -1 ? "Index: " + gridrec.selectedItemIndex : ""
           color: "white"
           font.pixelSize: 40
           font.bold: true
           anchors.bottom: parent.bottom
           anchors.right: parent.right
           anchors.rightMargin: 30
           anchors.bottomMargin: 30
       }
    GridView{
        id: gridView
        anchors.fill: parent
        anchors.centerIn: parent
        cellWidth: gridrec.width * 0.15
        cellHeight: gridrec.height * 0.18
        model: myModel
        anchors.left: parent.left
        anchors.leftMargin: cellWidth * 0.25
        anchors.top: parent.top
        anchors.topMargin: cellHeight * 0.6
        delegate: Rectangle {
            id:rec
            width: gridView.cellWidth * 0.8
            height: gridView.cellHeight * 0.7
            color: gridrec.selectedItemIndex === index ? "#287DE2" :"#238E28"
          //  border.color: gridrec.selectedItemIndex === index ?"white":"white"
          //  border.width:gridrec.selectedItemIndex === index ? 2.2:1
            radius: 25

            Text {
                anchors.centerIn: parent
                text: name
                color: gridrec.selectedItemIndex === index ?"white":"white"
                font.pixelSize: 18
                font.bold: true
            }


            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridrec.selectedItemIndex = index;
                    text:"\nIndex: " + index
                    console.log("Clicked item index:", index);
                    selectedIndexText.text = "Selected Item Index: " + index;

                    textCls.setName("Sujata")
                    textCls.setLastname("Sirsat")
                    textCls.setEmail("sujata.rs@gamil.com")
                    textCls.setVarphone("8976576655")
                    textCls.setAddress("Nashik,India")
                    textCls.setCity("Nashik")

                    textCls.setWebsite1("www.sddff.com")
                    // textCls.setHosting(radioButtonValue)
                    textCls.setProject("BE")

                    textCls.setValue("Sujata","Sirsat","sujata.rs@gamil.com","8976576655","Nashik,India","Nashik","BE")

                }
            }
        }
    }
    ListModel {
        id: myModel
        ListElement { name: "Music"}
        ListElement { name: "Movies"}
        ListElement { name: "Calender"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Camera"}
        ListElement { name: "Contact"}
        ListElement { name: "Convertor"}
        ListElement { name: "Data"}
        ListElement { name: "Read Data"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Camera"}
        ListElement { name: "Contact"}
        ListElement { name: "Music"}
        ListElement { name: "Movies"}
        ListElement { name: "Calender"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Camera"}
    }
}
