import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Calculator"

    Rectangle {
        color: "#f0f0f0"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 5

            // Input field to display the expression and results
            TextField {
                id: inputField
                width: parent.width
                height: 50
                readOnly: true
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                placeholderText: "0"
            }

            RowLayout {
                spacing: 5

                // Number buttons
                Repeater {
                    model: ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0"]

                    Button {
                        width: 70
                        height: 70
                        text: modelData
                        onClicked: {
                            inputField.text += modelData
                        }
                    }
                }
            }

            RowLayout {
                spacing: 5

                // Arithmetic operation buttons
                Repeater {
                    model: ["+", "-", "*", "/"]

                    Button {
                        width: 70
                        height: 70
                        text: modelData
                        onClicked: {
                            inputField.text += " " + modelData + " "
                        }
                    }
                }
            }

            RowLayout {
                spacing: 5

                // Clear and Equal buttons
                Button {
                    width: 70
                    height: 70
                    text: "C"
                    onClicked: {
                        inputField.text = ""
                    }
                }

                Button {
                    width: 70
                    height: 70
                    text: "="
                    onClicked: {
                        try {
                            inputField.text = eval(inputField.text)
                        } catch (e) {
                            inputField.text = "Error"
                        }
                    }
                }
            }
        }
    }
}
