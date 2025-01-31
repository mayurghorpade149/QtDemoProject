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
        text: qsTr("SIGN IN")
        font.italic: true
        font.pixelSize: 50
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }
    MainWindow{
        id : sign1
    }
    StackView{
        id:stack2
        anchors.fill: parent
        Rectangle{
            id:signup
            width:parent.width*0.4
            height: parent.height*0.6
            border.color: "black"
            border.width: 3
            anchors.centerIn:parent

            Label{
                id:user
                font.pixelSize: 22
                text:"UserName:"
                font.bold: true
                anchors.top: parent.top
                anchors.topMargin: 100
                anchors.left: parent.left
                anchors.leftMargin: 130
            }
            Image {
                id: usern
                height: parent.height*0.06
                width: parent.width*0.05
                source: "signup/username.png"
                //        anchors.right: usertext.left
                anchors.left:user.right
                anchors.leftMargin: 40
                //        anchors.rightMargin:5
                anchors.top: parent.top
                anchors.topMargin: 102
            }
            TextField{
                id:usertext
                height: parent.height*0.06
                width: parent.width*0.4
                placeholderText: "Username"
                validator: RegExpValidator { regExp: /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/ }
                anchors.left:usern.right
                anchors.leftMargin: 1
                anchors.top: parent.top
                anchors.topMargin: 100
                background: Rectangle {
                    id:redtext
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "black"
                    border.width: 1
                }
            }
            Label{
                id:pass
                font.pixelSize: 22
                text:"Password"
                font.bold: true
                anchors.top: user.bottom
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 130
            }
            Image {
                id: passw
                height: parent.height*0.06

                width: parent.width*0.05
                source: "signup/password.png"
                anchors.left:user.right
                anchors.leftMargin: 40
                anchors.top: usern.bottom
                anchors.topMargin: 19
            }

            TextField{
                id:word
                height: parent.height*0.06
                width: parent.width*0.4
                placeholderText: "Enter password"
                //        validator: RegExpValidator { regExp:  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]).{8,}$/; }
                anchors.left:passw.right
                anchors.top: usertext.top
                anchors.topMargin: 50
                echoMode: TextInput.Password
                Image {
                    width: 27
                    height: 27
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    source: word.echoMode === TextInput.Password ? "signup/hide.png":"signup/show.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            word.echoMode = word.echoMode === TextInput.Password ? TextInput.Normal : TextInput.Password;
                        }
                    }

                }
            }
            Button{
                id:submit
                height: 40
                width: 120
                anchors.top:word.bottom
                anchors.topMargin: 80
                anchors.left: parent.left
                anchors.leftMargin: 400

                background:
                    Rectangle{
                    id:r3
                    height: 40
                    width: 120
                    radius:20
                    color: submit.pressed ? "orange" : "white"
                    border.color: "black"
                    border.width: 3
                    Text {
                        id: lis
                        text: qsTr("Login")
                        font.pixelSize: 20
                        anchors.centerIn: r3
                    }
                }
                onClicked: {

                    var isValid= sign1.isValidEmail(usertext.text)
                    if (isValid) {
                        redtext.border.color="green"
                        console.log("Valid email address" )

                    } else {
                        // The email is invalid, do something here
                        redtext.border.color="red"
                        console.log("Invalid email address")
                        usertext.clear()
                    }
                }


            }
            Button{
                id:s1
                height: 40
                width: 120
                anchors.top: word.bottom
                anchors.topMargin: 80
                anchors.left: parent.left
                anchors.leftMargin: 250

                background:
                    Rectangle{
                    id:r1
                    height: 40
                    width: 120
                    radius:20
                    color: s1.pressed ? "orange" : "white"
                    border.color: "black"
                    border.width: 3
                    Text {
                        id: et
                        text: qsTr("SingUp")
                        font.pixelSize: 20
                        anchors.centerIn: r1
                    }

                }
            }
        }
    }
}
