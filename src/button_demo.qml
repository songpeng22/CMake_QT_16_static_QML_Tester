import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4

Window {
    id:root
	objectName: "objItem"
    visible: true
    width: 800
    height: 600
	
	Component {
        id: contactDelegate
        Item {
            width: grid.cellWidth; height: grid.cellHeight
            Column {
                anchors.fill: parent
                Rectangle { 
					color:"lime"; width:60;height:60; 
					anchors.horizontalCenter: parent.horizontalCenter 
					Button
					{
						width: parent.width
						height: parent.height
					}
				}
                Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
            }
			GridView.onAdd:{
				console.log("GridView::add:",index);
			}
        }
    }

	//Rectangle for TabBar
    Rectangle{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
        height:parent.height * 1 / 3
        width : parent.width
 
		//Button with Style
		Button {
			id: idButton1
			objectName: "objButton1"
			anchors.left : parent.left
			anchors.right : parent.right
			height: parent.height
			text: "Exit"
			enabled: false

			contentItem: Text {
				text: parent.text
				font: parent.font
				opacity: enabled ? 1.0 : 0.3
				color: parent.down ? "black" : "green"
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				elide: Text.ElideRight
			}

			background: Rectangle {
				implicitWidth: 100
				implicitHeight: 40
//				opacity: enabled ? 1 : 0.3
				color: parent.enabled ? ( parent.down ? "white" : "orange" ) : "gray"
				border.color: parent.down ? "red" : "black"
				border.width: 1
				radius: 2
			}

			onClicked:{
				console.log("idButton1 onClicked..")
			}
		}
     
    }
	
	//start of test buttons
	property var buttonFunctions : [
		function_test1,
		function_test2,
		function_test3,
		function_test1,
		function_test2,
		function_test3,
		function_test1,
		function_test2,
		function_test3,
	]
	
	ListModel {
        id: idListModel
        ListElement {
            name: "test1"
        }
        ListElement {
            name: "test2" 
        }
        ListElement {
            name: "test3"
        }
		ListElement {
            name: "test4"
        }
        ListElement {
            name: "test5" 
        }
        ListElement {
            name: "test6"
        }
		ListElement {
            name: "test7"
        }
        ListElement {
            name: "test8" 
        }
        ListElement {
            name: "test9"
        }
	}
	
	Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
        height: parent.height / 3
        width : parent.width
		anchors.top:idRect1.bottom
		
		GridLayout
		{
			id: idLayout1
			rows:3
			columns: 3
			
			Repeater {
				model: 9
				delegate: Button{
					property int buttonIndex: index
					contentItem: Text {
						text: idListModel.get(buttonIndex).name
						font.family: "Helvetica"
						color: "white"
						opacity: enabled ? 1.0 : 0.3
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						elide: Text.ElideRight
					}

					background: Rectangle {
						implicitWidth: 100
						implicitHeight: 40
						radius: 5
						opacity: enabled ? 1 : 0.3
						color:"#212121"
						border.width: 1
					}
					
					onClicked:{
						console.log( "buttonIndex : ",buttonIndex );
						buttonFunctions[buttonIndex]();
					}
				}
			}
		}	

    }
	//end of test buttons
	
	Rectangle{
        id:idRect3
        objectName : "objRect3"
        color: "tan"
        height: parent.height / 3
        width : parent.width
		anchors.top:idRect2.bottom
/*
		GridView {
			id: grid
			anchors.fill: parent
			cellWidth: 80; cellHeight: 80

			model: idListModel
			delegate: contactDelegate
			highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
			focus: true
			
			
		}
*/
		//Button with Style
		Button {
			id: idButton3
			objectName: "objButton3"
			anchors.left : parent.left
			text: "Exit"

			onClicked:{
				root.close();
			}
		}

    }
	
	function function_test1()
	{
		idButton1.enabled = !idButton1.enabled;
	}
	
	function function_test2()
	{
		
	}
	
	function function_test3()
	{
		
	}

	Component.onCompleted:{
//		console.log("value" , Global.value());
	}
}
