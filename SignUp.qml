import QtQuick 2.14
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14
import Qt.labs.settings 1.0
import MainWindowLib 1.0
Rectangle {
    id:signuppage
    border.color: "blue"
    border.width: 4
    width:mainStack.width
    height: mainStack.height * 0.8
    color: "grey"
    visible:true
    MainWindow{
        id:mainStack2
    }


    Label{
        id:up
        anchors.top:parent.top
        anchors.topMargin: parent.height*0.12
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.44

        Text {
            id: signup
            text: qsTr("Sign Up Page")
            font.pixelSize: 37
            font.bold: true
            color: "white"
        }
    }




    Rectangle{
        id:urec
        width:parent.width*0.3
        height:parent.height*0.55
        anchors.centerIn: parent
        Rectangle{
            id:urecchild
            width:parent.width*0.5
            height:parent.height
            Label{
                id:lbl1
                text: "                          Email:"
                //                color: "blue"
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.19
                font.pixelSize: 23
            }
            Image {
                id: userimg
                source: "passuserimg/username.png"
                width:25
                height: 21
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.20
            }
            TextField{
                id:txtinp1
                width:220
                height:26
                color: "blue"
                placeholderText: "Enter Email"
                font.pixelSize: 14
                background: Rectangle {
                    id:emailrec
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "black"
                    border.width: 1
                }
                anchors.left:urecchild.right
                anchors.top:parent.top
                anchors.topMargin: parent.height*0.19
                validator: RegExpValidator
                { regExp: /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/ }
            }
            Label {
                id:lbl2
                text: "                    Password:"
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.31
                font.pixelSize: 23
            }
            Image {
                id: passimg
                source: "passuserimg/pass.png"
                width: 25
                height: 25
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.31
            }
            TextField {
                id: txtinp2
                width: 220
                height: 26
                color: "blue"
                placeholderText: "Enter Password"
                font.pixelSize: 14
                background: Rectangle {
                    id:passrec
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "black"
                    border.width: 1
                }
                anchors.left: urecchild.right
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.31
                echoMode: TextInput.Password
                Image {
                    width: 21
                    height: 20
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    source: txtinp2.echoMode === TextInput.Password ? "passuserimg/visible.png" : "passuserimg/password.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            txtinp2.echoMode = txtinp2.echoMode === TextInput.Password ? TextInput.Normal : TextInput.Password;
                        }
                    }
                }
            }
            Label {
                id:lbl3
                text: "           Verify Password:"
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.43
                font.pixelSize: 23
            }
            Image {
                id: passimg2
                source: "passuserimg/pass.png"
                width: 25
                height: 25
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.43
            }
            TextField {
                id: txtinp3
                width: 220
                height: 26
                color: "blue"
                placeholderText: "verify Password"
                font.pixelSize: 14
                background: Rectangle {
                    id:verifyrec
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "black"
                    border.width: 1
                }
                anchors.left: urecchild.right
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.43
                echoMode: TextInput.Password
                Image {
                    width: 21
                    height: 20
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    source: txtinp3.echoMode === TextInput.Password ? "passuserimg/visible.png" : "passuserimg/password.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            txtinp3.echoMode = txtinp3.echoMode === TextInput.Password ? TextInput.Normal : TextInput.Password;
                        }
                    }
                }
            }


        }
        Button{
            id:btn
            width:110
            height:35
            anchors.left:parent.left
            anchors.leftMargin: parent.width*0.42
            anchors.top:parent.top
            anchors.topMargin: parent.height*0.6

            background: Rectangle {
                id: btnrec
                color: btn.pressed ? "lightblue" : "white"
                radius: 12
                border.color: "blue"
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: false
                    horizontalOffset: 0
                    radius: 4
                    samples: 9
                    color: "blue"
                    verticalOffset: 0
                    spread: 1
                }
                Text {
                    id: btntxt2
                    text: "Sign Up"
                    font.pixelSize: 18
                    anchors.centerIn: parent
                }
            }
            onClicked: {
                var isValid = mainStack2.isValidEmail(txtinp1.text);
                var pass=txtinp2.text
                var vpass=txtinp3.text
                if(isValid){
                    console.log("Valid email");
                    if(pass==vpass){
                        passrec.border.color="green"
                        verifyrec.border.color="green"
                        console.log("Password verified");
                        var user = txtinp1.text
                        var varpass= txtinp2.text
                    }
                    else{
                        passrec.border.color="red"
                        verifyrec.border.color="red"
                        console.log("Password not verified");
                    }

                    emailrec.border.color="green"
                }
                else{
                    if(pass==vpass){
                        passrec.border.color="green"
                        verifyrec.border.color="green"
                        console.log("Password verified");
                    }
                    else{
                        passrec.border.color="red"
                        verifyrec.border.color="red"
                        console.log("Password not verified");
                    }

                    emailrec.border.color="red"
                    console.log("InValid email");

                }
            }
        }


    }
}

