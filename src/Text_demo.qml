import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: root
	width: 640
	height: 400
	color: "tan"
	
	property var buttonWidth: 100
	property var buttonHeight: 40
	
	Rectangle
	{
        id:idRect1
        objectName : "objRect1"	
		anchors.top: parent.top
        height:parent.height * 30 / 50
        width : parent.width		
		color: "magenta"
		
		Text
		{
			id: idText
			objectName: "objText"
	//		anchors.centerIn: parent
			anchors.fill: parent
			horizontalAlignment: Text.AlignRight
			verticalAlignment: Text.AlignBottom		
			text: "text"
			font.family: "Microsoft YaHei"
			font.pointSize: 34
			color: "white"
			antialiasing: true;	//抗锯齿
			baseUrl: "www.baidu.com";
		
			Component.onCompleted: {
				console.log("default font family:",font.pointFamily);
				console.log("default font size:",font.pointSize);
				
			}
		}		
	}
	
	Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
        height: parent.height * 20 / 50
        width : parent.width
		anchors.top:idRect1.bottom
		
		GridLayout
		{
			id: idLayout1
			rows: parent.height / buttonHeight //3
			columns: root.width / buttonWidth  //6
			anchors.horizontalCenter : parent.horizontalCenter
			
			Repeater {
				model: idLayout1.rows * idLayout1.columns //9
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
						console.log("id:",this);
					}
				}
			}
		}	

    }
	//end of test buttons	

	//start of test buttons
	property var buttonFunctions : [
		function_test1,
		function_test2,
		function_test3,
		function_test4,
		function_test5,
		function_test6,
		function_test7,
		function_test8,
		function_test9,
	]
	
	ListModel {
        id: idListModel
        ListElement {
            name: "align left"
        }
        ListElement {
            name: "align h center" 
        }
        ListElement {
            name: "align right"
        }
		ListElement {
            name: "align top"
        }
        ListElement {
            name: "align v center" 
        }
        ListElement {
            name: "align bottom"
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
	
	function function_test1()
	{
		idText.horizontalAlignment = Text.AlignLeft;
	}
	
	function function_test2()
	{
		idText.horizontalAlignment = Text.AlignHCenter;
	}
	
	function function_test3()
	{
		idText.horizontalAlignment = Text.AlignRight;
	}
	
	function function_test4()
	{
		idText.verticalAlignment = Text.AlignTop;
	}
	
	function function_test5()
	{
		idText.verticalAlignment = Text.AlignVCenter;
	}
	
	function function_test6()
	{
		idText.verticalAlignment = Text.AlignBottom;
	}
	function function_test7()
	{
		
	}
	
	function function_test8()
	{
		
	}
	
	function function_test9()
	{

	}	
}
