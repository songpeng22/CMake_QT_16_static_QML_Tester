import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Rectangle
{
	width: 600; height: 400

    ListModel {
        id:idListModel
        ListElement {
            name: "1_Bill Smith"
            number: "555 3264"
        }
        ListElement {
            name: "2_John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "3_Sam Wise"
            number: "555 0473"
        }
    }

	Component{
        id: contactDelegate

        Item {
            width: 180; height: 40
            Column {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
            }
        }

/*
        Rectangle {
            id: wrapper
            width: 180
            height: contactInfo.height
            color: ListView.isCurrentItem ? "black" : "red"
            Text {
                id: contactInfo
                text: name + ": " + number
                color: wrapper.ListView.isCurrentItem ? "red" : "black"
            }
        }
*/
    }

	ColumnLayout{
        width: parent.width
        spacing: 10
		Rectangle
        {
            width: 600
            height: 100

            ListView {
                id: idListView
                anchors.fill: parent
                width: 180 ; height: 100
                model:idListModel
                delegate: contactDelegate
                highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                focus: true
                orientation: ListView.Horizontal
                layoutDirection: Qt.RightToLeft
    //            verticalLayoutDirection: ListView.BottomToTop
//                flickableDirection: Flickable.AutoFlickDirection 
            }
        }

        Rectangle{
            width: 600
            height:40
            ColumnLayout{
                Button{
                    implicitWidth: 300
                    implicitHeight: 40
                    text: "switch Horizontal/vertial"
                    onClicked:{
                        if( idListView.orientation == ListView.Horizontal )
                            idListView.orientation = ListView.Vertical
                        else
                            idListView.orientation = ListView.Horizontal;
                    }
                }
                
                Button{
                    implicitWidth: 300
                    implicitHeight: 40
                    text: "switch Align Left/Right"
                    onClicked:{
                        if( idListView.layoutDirection == Qt.LeftToRight )
                            idListView.layoutDirection = Qt.RightToLeft;
                        else
                            idListView.layoutDirection = Qt.LeftToRight;
                    }
                }

                Button{
                    implicitWidth: 300
                    implicitHeight: 40
                    text: "switch Alig Top/Bottom"
                    onClicked:{
                        if( idListView.verticalLayoutDirection == ListView.TopToBottom )
                            idListView.verticalLayoutDirection = ListView.BottomToTop
                        else
                            idListView.verticalLayoutDirection = ListView.TopToBottom
                    }
                }
            }

        }
    }
}


