import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4

Item {
    id:root
	objectName: "objItem"
    visible: true
    width: 800
    height: 600
	
	Config
	{
		id:config
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
	
	Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
        height: parent.height / 2
        width : parent.width
		
		GridLayout
		{
			id: idLayout1
			rows:3
			columns: config.colors[buttonIndex] / rows + 1
			
			Repeater {
				model: config.colors.length
				delegate: Button{
					property int buttonIndex: index
					contentItem: Text {
						text: config.colorsText[buttonIndex]//idListModel.get(buttonIndex).name
						font.family: "Helvetica"
						color: config.colors[buttonIndex] == "#000000" ? "white" : "black"
						opacity: enabled ? 1.0 : 0.3
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						elide: Text.ElideRight
					}

					background: Rectangle {
						implicitWidth: 200
						implicitHeight: 50
						radius: 5
						opacity: enabled ? 1 : 0.3
						color: config.colors[buttonIndex]
						border.width: 1
					}
					
					onClicked:{
						console.log( "buttonIndex : ",buttonIndex );
						console.log( "config.colors[buttonIndex] : ",config.colors[buttonIndex] );
//						buttonFunctions[buttonIndex]();
					}
				}
			}
		}	

    }
	//end of test buttons
	
	Rectangle{
        id:idRect3
        objectName : "objRect3"
        color: "teal"
        height: parent.height / 2
        width : parent.width
		anchors.top:idRect2.bottom

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
}
