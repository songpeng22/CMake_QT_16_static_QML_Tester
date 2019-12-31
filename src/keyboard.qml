import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	id: idItemKeyBoard
	width: 400
	height: 400
	color: "black"
	
	property var varStrOld;
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
	
	Item
	{
		y: 20
		width: 320
		anchors.horizontalCenter: parent.horizontalCenter
		
		Rectangle
		{
			id: idRectText
			width: parent.width
			height: 40
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
			y: idRectText.height + 10
			anchors.horizontalCenter: parent.horizontalCenter
			Repeater {
				model: 3
				delegate: Button{
						property int buttonIndex: index
						contentItem: Text {
							text: buttonText[index]
							font: idButtonWESStart.font
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
		}
		
		ColumnLayout
		{
			id: idLayout2
			y: idLayout1.y + idLayout1.height + 20
			anchors.horizontalCenter: parent.horizontalCenter
			
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
								font: idButtonWESStart.font
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
		}
		
		RowLayout
		{
			id: idLayout3
			y: idLayout2.y + idLayout2.height + 30
			
			anchors.horizontalCenter: parent.horizontalCenter
			Repeater {
				model: 2
				delegate: Button{
						property int buttonIndex: index
						contentItem: Text {
							text: buttonTextOK[index]
							font: idButtonWESStart.font
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
		idTextEdit.text = idTextEdit.text.concat(text);
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

		var strReturn = idTextEdit.text;
		console.log("strReturn:",strReturn);
	}
	
	function function_Cancel()
	{
		console.log("function_Cancel:",7);

		var strReturn = varStrOld;
		console.log("strReturn:",strReturn);
	}
	
	Component.onCompleted: {
		var str = "";
		idTextEdit.text = "-1";
		varStrOld = idTextEdit.text;
		if( idTextEdit.text >= 0 )
		{
			str = "+";
			console.log("+number:",idTextEdit.text);
			idTextEdit.text = str.concat(idTextEdit.text.substring(0,idTextEdit.text.length));
		}
		else
		{
			str = "";
			console.log("+number:",idTextEdit.text);
			idTextEdit.text = str.concat(idTextEdit.text.substring(0,idTextEdit.text.length));
		}
	}
}
