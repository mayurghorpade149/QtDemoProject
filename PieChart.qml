import QtQuick 2.14
import QtQuick.Controls 2.2
import MainWindowLib 1.0
import QtCharts 2.14

Rectangle{
    id: pierec
    width: mainStack.width
    height: mainStack.height * 0.8

    ChartView {
        id: piechart
        title: "Favourite Sports over World"
        width: pierec.width
        height: pierec.height
        //  anchors.left: piechr.left
        legend.visible: false
        antialiasing: true

        PieSeries {
            id: pieOuter
            size: 0.7
            holeSize: 0.7
            PieSlice { id: slice; label: "Cricket"; value: 40; color: "#8AB846" }
            PieSlice { label: "Hockey"; value: 15; color: "#ff1493" }
            PieSlice { label: "Football"; value: 20; color: "#DF8939" }
            PieSlice { label: "Basketball"; value: 15; color: "#C0EEFF" }
            PieSlice { label: "Badminton"; value: 10; color: "#ffff00" }
        }

        PieSeries {
            size: 0.7
            id: pieInner
            holeSize: 0.15

            PieSlice { label: "40 %"; value: 40; color: "#8AB846" }
            PieSlice { label: "15 %"; value: 15; color: "#ff1493" }
            PieSlice { label: "20 %"; value: 20; color: "#DF8939" }

            PieSlice { label: "15 %"; value: 15; color: "#C0EEFF" }
            PieSlice { label: "10 %"; value: 10; color: "#ffff00" }
        }
    }

    Component.onCompleted: {
        // Set the common slice properties dynamically for convenience
        for (var i = 0; i < pieOuter.count; i++) {
            pieOuter.at(i).labelPosition = PieSlice.LabelOutside;
            pieOuter.at(i).labelVisible = true;
            //   pieOuter.at(i).borderWidth = 3;
        }
        for (var i = 0; i < pieInner.count; i++) {
            pieInner.at(i).labelPosition = PieSlice.LabelInsideNormal;
            pieInner.at(i).labelVisible = true;
            //   pieInner.at(i).borderWidth = 2;
        }
    }
}
