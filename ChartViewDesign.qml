import QtQuick 2.14
import QtQuick.Controls 2.2
import MainWindowLib 1.0
import QtCharts 2.14


Rectangle{
    id: upprec
    width: mainStack.width
    height: mainStack.height
  //   color: "red"

    Rectangle{
        id: upperrec
        width: parent.width
        height: parent.height * 0.15
      //  color: "red"
    StackView {
        id: chartStackView
      //  anchors.top: parent.bottom
        initialItem: page2

    }

    Row {
        spacing: 80
        anchors{
            centerIn: parent
        }
        RoundButton {
            text: "Pie Chart"
            font.pixelSize: 20
            width: 100
            height: 50
            onClicked:{
                mainStackView.pop()
                mainStackView.push("PieChart.qml")
                console.log("Button 1 clicked")
            }
        }
        RoundButton {
            text: "Line Chart"
            font.pixelSize: 20
            width: 120
            height: 50
            onClicked:{
                mainStackView.pop()
                mainStackView.push("LineChart.qml")
                console.log("Button 1 clicked")
            }
        }

        RoundButton {
            text: "Bar Chart"
            font.pixelSize: 20
            width: 100
            height: 50
            onClicked:{
                mainStackView.pop()
                mainStackView.push("BarChart.qml")
                console.log("Button 1 clicked")
            }
        }
    }
 }

    Component {
        id: page2
        Rectangle {
            id:recinit
            color: "khaki"
            width:upprec.width
            height: upprec.height * 0.8
            border.color: "blue"
            Text {
                text: "Hello Welcome To ChartView"
                font.pointSize: 50
                anchors.centerIn: recinit
            }

        }
    }

}
