import QtQuick 2.14
import QtQuick 2.2
import QtQuick.Controls 2.14
import MainWindowLib 1.0
import QtQuick.Dialogs 1.0



Rectangle {
    id: mainWindowapp
    width: mainStack.width
    height: mainStack.height * 0.8
    border.color: "gray"
    visible: true

    MainWindow{
        id: textCls
    }
    onFocusChanged: {
        textCls.readJsonFile()
    }

    Label{
        id: heading
        text: "Contact Us Today!"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 400
        font.pixelSize: 25


    }


    Rectangle{
        id: loginRect
        width: parent.width * 0.5
        height: parent.height * 0.8

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Rectangle {
            id:innerRect
            width: parent.width * 0.8
            height: parent.height * 0.8

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label{
                id: firstname
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "First Name"
                font.bold: true
                anchors.top: parent.top
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left

            }

            TextField {
                id : nameId
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "First Name"
                validator: RegExpValidator {
                    regExp: /^[a-zA-Z\s]*$/
                }
                onValidatorChanged:   {
                    if (!validator) {

                    }
                    console.log("Invalid name format.",validator)
                }


                anchors.top: parent.top
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right


            }

            Label{
                id: lastname
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "Last Name"
                font.bold: true
                anchors.top: firstname.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            TextField {
                id: tlast
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "Last Name"
                validator: RegExpValidator {
                    regExp: /^[a-zA-Z\s]*$/
                }
                onValidatorChanged:  {
                    if (!validated) {
                        // Invalid input, display an error message
                        console.log("Invalid name format.")
                        // You can also show an error message to the user using a Label or Dialog
                    }
                }
                anchors.top: nameId.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }
            Label{
                id: email
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "E-Mail"
                font.bold: true
                anchors.top: lastname.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            TextField {
                id: temail
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "E-Mail Address"
                validator: RegExpValidator {
                    regExp: /^[\w.-]+@\w+\.\w+$/
                }
                anchors.top: tlast.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            Label{
                id: phone
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "Phone"
                font.bold: true
                anchors.top: email.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            TextField {
                id: tphone
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "+(91)522 1212"
                validator: RegExpValidator {
                    regExp: /^\d{10}$/
                }
                anchors.top: temail.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            Label{
                id: address
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "Address"
                font.bold: true
                anchors.top: phone.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            TextField {
                id: taddress
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "Address"
                validator: RegExpValidator {
                    regExp: /^.{1,255}$/ // Regular expression to allow 1 to 255 characters
                }
                anchors.top: tphone.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            Label{
                id: city
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "City"
                font.bold: true
                anchors.top: address.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            TextField {
                id: tcity
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "city"
                validator: RegExpValidator {
                    regExp: /^[a-zA-Z\s]*$/ // Regular expression to allow only letters and spaces
                }
                anchors.top: taddress.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            Label{
                id: state
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "Country"
                font.bold: true
                anchors.top: city.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            ComboBox {
                id: stateDropdown
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                model: [ "India", "Ireland", "Australia" ] // Replace with your own state options

                anchors.top: tcity.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            Label{
                id: website
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                text: "Profession"
                font.bold: true
                anchors.top: state.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.left: parent.left
            }
            TextField {
                id: twebsite
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "Profession"
                validator: RegExpValidator {
                    regExp: /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-zA-Z0-9]+([-.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}([\/]{1}[a-zA-Z0-9#]+)*$/ // Regular expression for website validation
                }
                anchors.top: stateDropdown.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            Label{
                id: pd
                height: innerRect.height*0.3
                width: innerRect.width*0.5
                text: "Qualification"
                font.bold: true
                anchors.top: website.bottom
                anchors.topMargin: parent.width * 0.01
                anchors.left: parent.left
            }
            TextField {
                id: tpd
                height: innerRect.height*0.08
                width: innerRect.width*0.5
                placeholderText: "Qualification"
                validator: RegExpValidator {
                    regExp: /^.{10,}$/
                }
                anchors.top: twebsite.bottom
                anchors.topMargin: parent.width * 0.005
                anchors.right: parent.right
            }

            // json buttons

            Button {
                id : jsonwrite
                height: 30
                width: 80
                text: "Json Write"
                font.bold: true
                anchors.bottom: innerRect.bottom
                anchors.right: innerRect.left
                anchors.bottomMargin: -30
                anchors.rightMargin: -200
                onClicked: {

                    var data = firstname.text + " : " + nameId.text + "\n" + lastname.text + " : " + tlast.text + "\n" + email.text + " : " + temail.text + "\n" + phone.text  + " : " + tphone.text + "\n" + address.text + " : " + taddress.text + "\n" + city.text + " : " + tcity.text + "\n" + state.text + " : " + stateDropdown.currentText + "\n" + website.text + " : " + twebsite.text + "\n" + pd.text + " : "  + tpd.text
                    //  textCls.setTextData(data)
                    textCls.setName(nameId.text)
                    textCls.setLastname(tlast.text)
                    textCls.setEmail(temail.text)
                    textCls.setVarphone(tphone.text)
                    textCls.setAddress(taddress.text)
                    textCls.setCity(tcity.text)

                    textCls.setWebsite1(twebsite.text)
                    // textCls.setHosting(radioButtonValue)
                    textCls.setProject(tpd.text)

                    textCls.setValue(nameId.text,tlast.text,temail.text,tphone.text,taddress.text,tcity.text,tpd.text)

                    // textCls.writeFile(fileDialog)

                    //   textCls.writeFile(data)
                    nameId.text=""
                    tlast.text=""
                    temail.text=""
                    tphone.text=""
                    taddress.text=""
                    tcity.text=""

                    twebsite.text=""

                    tpd.text=""

                    textCls.writeJsonFile()

                }
            }

            Button {
                id : jsonread
                height: 30
                width: 80
                text: "Json Read"
                font.bold: true
                anchors.bottom: innerRect.bottom
                anchors.right: innerRect.left
                anchors.bottomMargin: -30
                anchors.rightMargin: -450
                onClicked: {

                    nameId.text = textCls.getName()
                    tlast.text = textCls.getLastname()
                    temail.text = textCls.getEmail()
                    tphone.text = textCls.getVarphone()
                    taddress.text = textCls.getAddress()
                    tcity.text = textCls.getCity()
                    twebsite.text = textCls.getWebsite1()
                    tpd.text = textCls.getProject()

                    textCls.readJsonFile()


                }
            }
        }
    }


}


