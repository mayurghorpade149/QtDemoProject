import QtQuick 2.14
import QtQuick.Controls 2.2
import MainWindowLib 1.0
import QtCharts 2.14

Rectangle{
    width: mainStack.width
    height: mainStack.height * 0.8


    ChartView {
        id: chart
        title: "Student Performance"
        width: parent.width
        height: parent.height
        //  theme: ChartView.ChartThemeBrownSand
        anchors.left: piechart.right
        antialiasing: true
        ValueAxis {
            id: axisY
            tickCount: 3
            max: 4
            min: 0
        }
        DateTimeAxis{
            id: xTime
            gridVisible: false
        }

        ToolTip {
            id: id_tooltip
            contentItem: Text{
                color: "#21be2b"
                text: id_tooltip.text
            }
            background: Rectangle {
                border.color: "#21be2b"
            }
        }

        SplineSeries{
            id: chartseries
            width: 7
            XYPoint { x: new Date('December 17, 2000 03:24:00').getTime() ; y: 0.0 }
            XYPoint { x: new Date('December 18, 2001 04:25:00').getTime() ; y: 3.2 }
            XYPoint { x: new Date('December 19, 2002 05:26:00').getTime() ; y: 2.4 }
            XYPoint { x: new Date('December 20, 2003 06:27:00').getTime() ; y: 2.1 }
            XYPoint { x: new Date('December 21, 2004 07:24:00').getTime() ; y: 0.0 }
            XYPoint { x: new Date('December 22, 2005 08:25:00').getTime() ; y: 3.2 }
            XYPoint { x: new Date('December 23, 2006 09:26:00').getTime() ; y: 2.4 }
            XYPoint { x: new Date('December 24, 2007 10:27:00').getTime() ; y: 2.1 }



            pointsVisible: true
            pointLabelsVisible: false
            useOpenGL: true
            axisX: xTime
            axisY: axisY
            onClicked: {
                var p = chart.mapToPosition(point)
                var text = qsTr("x: %1, y: %2").arg(new Date(point.x).toLocaleDateString(Qt.locale("en_US"))).arg(point.y)
                id_tooltip.x = p.x
                id_tooltip.y = p.y - id_tooltip.height
                id_tooltip.text = text
                //id_tooltip.timeout = 1000
                id_tooltip.visible = true
            }
        }
    }

}
