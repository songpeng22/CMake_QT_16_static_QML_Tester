import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Popup
{
	id: popup
	width: 310
	height: 410
	
	property var strPutIn: "";
	property var strReturn: "";
	property var varStrOld: "";
	property var buttonText : [ "BS","CE","Clear"]
	property var buttonTextNum : ["7","8","9","4","5","6","1","2","3","","0","+/" ]
	property var buttonTextOK : ["OK","Cancel"]
	property var buttonCFunction : [
		function_BS,
		function_CE,
		function_Clear
	]
	property var buttonNumberFunction : [
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Positive_Negative
	]
	property var buttonOKFunction : [
		function_OK,
		function_Cancel
	]
	
	property var rectangleWidth: 300
	property var rectangleHeight: 380
	property var buttonWidth: rectangleWidth / 4
	property var buttonHeight: 40
	
	property var spacing1: 20
	property var spacing2: 15
	property var spacing3: 10
	property var spacing4: 20
	
	Rectangle
	{
		id: idItemKeyBoard
		width: rectangleWidth
		height: rectangleHeight
		anchors.centerIn: parent
		color: "black"
		
		Item
		{
			y: spacing1
			width: parent.width
			anchors.horizontalCenter: parent.horizontalCenter
			
			Rectangle
			{
				id: idRectText
				width: parent.width - rectangleWidth / 4
				height: 40
				anchors.horizontalCenter: parent.horizontalCenter
				border.width: 2
				border.color: "lightblue"
				
				Text
				{
					id: idTextEdit
					width: parent.width
					focus: true
					font.family: "Helvetica"
					font.pointSize: 20
				}
			}
			
			RowLayout
			{
				id: idLayout1
				y: idRectText.height + spacing2
				anchors.horizontalCenter: parent.horizontalCenter
				spacing: 4 
				Repeater {
					model: 3
					delegate: Button{
							property int buttonIndex: index
							contentItem: Text {
								text: buttonText[index]
								font.family: "Helvetica"
								color: "white"
								opacity: enabled ? 1.0 : 0.3
								horizontalAlignment: Text.AlignHCenter
								verticalAlignment: Text.AlignVCenter
								elide: Text.ElideRight
							}

							background: Rectangle {
								implicitWidth: buttonWidth
								implicitHeight: buttonHeight
								radius: 5
								opacity: enabled ? 1 : 0.3
								color:"#212121"
		//						border.color: idButtonWESStart.down ? Config.btnColorBorderDown : Config.btnColorBorderNormal
								border.width: 1
							}
							
							onClicked:{
								console.log( "buttonIndex : ",buttonIndex );
								buttonCFunction[buttonIndex]();
							}
						}
			
					Component.onCompleted: {
	//					console.log( "Repeater model : ",model );
	//					console.log( "Repeater count: ",count);
					}
					
					onItemAdded:{
	//					console.log( "Repeater index : ",index );
					}
				}
				Component.onCompleted: console.log( "idLayout1 width : ",width );
			}
			
			ColumnLayout
			{
				id: idLayout2
				y: idLayout1.y + idLayout1.height + spacing3
				width: idLayout1.width
				anchors.horizontalCenter: parent.horizontalCenter
				spacing: 4 
				
				Repeater {
					id: idRepeaterCol
					model: 4
					delegate: Row {
						spacing: 3
						
						Repeater {
							id: idRepeaterRow
							property int colIndex: index
							model: 3
							delegate: Button{
								property int buttonIndex: idRepeaterRow.colIndex * 3 + index
								text: buttonTextNum[idRepeaterRow.colIndex * 3 + index ]
								contentItem: Text {
									text: buttonTextNum[idRepeaterRow.colIndex * 3 + index ]
									font.family: "Helvetica"
									color: "white"
									opacity: enabled ? 1.0 : 0.3
									horizontalAlignment: Text.AlignHCenter
									verticalAlignment: Text.AlignVCenter
									elide: Text.ElideRight
								}

								background: Rectangle {
									implicitWidth: buttonWidth
									implicitHeight: buttonHeight
									radius: 5
									opacity: enabled ? 1 : 0.3
									color:"#212121"
			//						border.color: idButtonWESStart.down ? Config.btnColorBorderDown : Config.btnColorBorderNormal
									border.width: 1
								}
								
								onClicked:{
	//								console.log("Button Text:",text);
	//								idTextEdit.text = (idTextEdit.text.concat(text));

									buttonNumberFunction[buttonIndex](text);
								}
							}
							Component.onCompleted: console.log( "Repeater count: ",count);
							onItemAdded:{
								console.log( "colIndex.index:",idRepeaterRow.colIndex);
								console.log( "idRepeaterRow.index:",index);
							}
						}
					}
					Component.onCompleted: console.log( "Repeater count: ",count);
					onItemAdded:{
	//					console.log( "onItemAdded.");
					}
				}
				Component.onCompleted: console.log( "idLayout2 width : ",width );
			}
			
			RowLayout
			{
				id: idLayout3
				y: idLayout2.y + idLayout2.height + spacing4
				
				anchors.horizontalCenter: parent.horizontalCenter
				Repeater {
					model: 2
					delegate: Button{
							property int buttonIndex: index
							contentItem: Text {
								text: buttonTextOK[index]
								font.family: "Helvetica"
								color: "white"
								opacity: enabled ? 1.0 : 0.3
								horizontalAlignment: Text.AlignHCenter
								verticalAlignment: Text.AlignVCenter
								elide: Text.ElideRight
							}

							background: Rectangle {
								implicitWidth: buttonWidth
								implicitHeight: buttonHeight
								radius: 5
								opacity: enabled ? 1 : 0.3
								color:"#212121"
		//						border.color: idButtonWESStart.down ? Config.btnColorBorderDown : Config.btnColorBorderNormal
								border.width: 1
							}
							
							onClicked:{
								console.log( "buttonIndex : ",buttonIndex );
								buttonOKFunction[buttonIndex]();
							}
						}
				
					Component.onCompleted: {
	//					console.log( "Repeater model : ",model );
	//					console.log( "Repeater count: ",count);
					}
					
					onItemAdded:{
	//					console.log( "Repeater index : ",index );
					}
				}
			}
		}
	}
	
	function function_BS()
	{
		console.log("function_BS:",1);
		idTextEdit.text = (idTextEdit.text.substring(0,idTextEdit.text.length - 1));
	}
	
	function function_CE()
	{
		console.log("function_CE:",2);
		//nothing
	}
	
	function function_Clear()
	{
		console.log("function_Clear:",3);
		idTextEdit.text = "-"
	}
	
	function function_Add(text)
	{
		console.log("function_Add:",4);
		var strNumber = "";
		var str = "";
		strNumber = Number(idTextEdit.text.concat(text));
		if( strNumber >= 0  ){
			str = "+";
			idTextEdit.text = str.concat(strNumber);
		}
		else
		{
			str = "";
			idTextEdit.text = str.concat(strNumber);
		}
	}
	
	function function_Positive_Negative(text)
	{
		console.log("function_Add:",5);
		var str = "";
		var strNumber = "";
		
		if( idTextEdit.text >= 0 )
		{
			console.log("+number:",idTextEdit.text);
			str = "-";
		}
		else
		{
			console.log("-number:",idTextEdit.text);
			str = "+";
		}
			
		console.log("function_Positive_Negative str:",str);
		
		idTextEdit.text = str.concat(idTextEdit.text.substring(1,idTextEdit.text.length));
	}
	
	function function_OK()
	{
		console.log("function_OK:",6);

		strReturn = Number(idTextEdit.text);
		console.log("strReturn:",strReturn);
		
		popup.close();
	}
	
	function function_Cancel()
	{
		console.log("function_Cancel:",7);

		strReturn = Number(varStrOld);
		console.log("strReturn:",strReturn);
		
		popup.close();
	}
	
	function init() {
		var str = "";
		var strTemp = "";
		strTemp = strPutIn;//"-1";
		console.log("strPutIn:",strPutIn);
		varStrOld = strPutIn;
		if( strTemp >= 0 )
		{
			str = "+";
			console.log("+number:",strTemp);
			idTextEdit.text = str.concat(strTemp);
		}
		else
		{
			str = "";
			console.log("-number:",strTemp);
			idTextEdit.text = str.concat(strTemp);
		}
	}
	
}