import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Window {
    id: root
    visible: true
    width: 800//1024//640
    height: 600//600//480
    minimumWidth: width
    minimumHeight: height
    //prevent resizable
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    title: qsTr("Retail-Scale-Service-Stick")
    color: "#F0F0F0" //uiFlag ? "#D8ECF5" : "lightgrey"


    property bool bTest: false
    property var uiFlag: 0

    property var marginValue: 10
    property var leftMargin: 10
    property var topMargin: 10
    property var rightMargin: 10
    property var bottomMargin: 10

    property var spaceValue: 10

    property var buttonWidth: 100
    property var buttonHeight:100
    property var buttonMargin: 100

    property var contentButtonWidth: 260//300
    property var contentButtonMargin: 20

    property color borderColor: "#BDBDBD"

    ColumnLayout
    {
        id: columnLayout
//        anchors.fill: parent

        width: root.width
        height: root.height

        spacing: spaceValue

        Rectangle {
            id: rectTop
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: columnLayout.width - marginValue * 2
            Layout.preferredHeight: columnLayout.height * 20 / 100
//            Layout.margins: marginValue
            Layout.topMargin: marginValue
            Layout.leftMargin: marginValue
            Layout.rightMargin: marginValue
//            height: columnLayout.height * 20 / 100

//            color: "red"
            border.color: borderColor

            Button {
                id: poweroff
                anchors.top: parent.top
                anchors.topMargin: marginValue
                anchors.right: parent.right
                anchors.rightMargin: marginValue

                implicitWidth: buttonWidth
                implicitHeight: buttonHeight
                height: parent.height - marginValue * 2
                width: height

                icon.color: "transparent"
                icon.source: "images/shutdown.png"
                icon.width: buttonWidth
                icon.height: buttonHeight

                onClicked: {
                    caller.poweroff();
                }

                Component.onCompleted:
                {
                    console.log( "poweroff.width:",poweroff.width );
                    console.log( "poweroff.height:",poweroff.height );
                }
            }

            Button {
                id: country
                anchors.top: parent.top
                anchors.topMargin: marginValue
                x: poweroff.x - 300

                implicitWidth: buttonWidth
                implicitHeight: buttonHeight
                height: parent.height - marginValue * 2
                width: height

                icon.color: "transparent"
                icon.source: "images/USA.png"
                icon.width: buttonWidth
                icon.height: buttonHeight

                onClicked: {
                    if( config.language === "en" )
                    {
                        trans.selectLanguage("de");
                        country.icon.source = "qrc:/images/Germany.png"
                        config.language = "de"
                    }
                    else if( config.language === "de" )
                    {
                        trans.selectLanguage("en");
                        country.icon.source = "qrc:/images/USA.png"
                        config.language = "en"
                    }
                    else{}
                }

                Component.onCompleted:
                {
                    console.log( "poweroff.width:",poweroff.width );
                    console.log( "poweroff.height:",poweroff.height );
                }
            }

            Component.onCompleted:
            {
                console.log( "rectTop.width:",rectTop.width );
                console.log( "rectTop.height:",rectTop.height );
            }
        }

        Rectangle {
            id: rectSubTop
            Layout.alignment: Qt.AlignCenter
//            Layout.margins: marginValue
            Layout.leftMargin: marginValue
            Layout.rightMargin: marginValue
            Layout.preferredWidth: columnLayout.width - marginValue * 2
            Layout.preferredHeight: columnLayout.height * 10 / 100
//            height: columnLayout.height * 10 / 100

//            color: "red"
            border.color: borderColor

            TextField {
                id: status
                anchors.margins: marginValue
//                anchors.top: parent.top
//                anchors.topMargin: marginValue
//                anchors.left: parent.left
//                anchors.leftMargin: marginValue
                anchors.fill: parent


                color: "black"
                text: qsTr("status")
            }

            Component.onCompleted:
            {
                console.log( "rectSubTop.width:",rectSubTop.width );
                console.log( "rectSubTop.height:",rectSubTop.height );
            }
        }

        Rectangle {
            id: rectContent
            Layout.alignment: Qt.AlignCenter
//            Layout.margins: marginValue
            Layout.leftMargin: marginValue
            Layout.rightMargin: marginValue
            Layout.bottomMargin: marginValue
            Layout.preferredWidth: columnLayout.width - marginValue * 2
            Layout.preferredHeight: columnLayout.height * 70 / 100 - marginValue * 2 - spaceValue * 2
//            height: columnLayout.height * 70 / 100 - spaceValue * 2

//            color: "red"
            border.color: borderColor
			
			Flickable_GridLayout
			{

			}

            Component.onCompleted:
            {
                console.log( "rectContent.width:",rectContent.width );
                console.log( "rectContent.height:",rectContent.height );
            }
        }

        Component.onCompleted:
        {
            console.log( "columnLayout.width:",columnLayout.width );
            console.log( "columnLayout.height:",columnLayout.height );
            console.log( "parent.width:",parent.width );
            console.log( "parent.height:",parent.height );
        }
    }

    

}
