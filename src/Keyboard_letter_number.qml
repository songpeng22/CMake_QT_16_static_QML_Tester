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
	width: popupWidth
	height: popupHeight
	
	property var strPutIn: "";
	property var strReturn: "";
	property var varStrOld: "";
	property var bReplace : true;
	property var buttonText : [ "BS","CE","Clear"]
	property var buttonTextNum : ["7","8","9","C","D","I","4","5","6","M","P","R","1","2","3","S","W","",".","0","-","/","SP","" ]
	property var buttonVisible : [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false ]
	property var buttonTextOK : ["OK","Cancel"]
	property var buttonCFunction : [
		function_BS,
		function_CE,
		function_Clear
	]
	property var buttonNumberFunction : [
		function_Add,//1
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,//11
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,
		function_Add,//21
		function_Add,
		function_Add,
		function_Add,
		
	]
	property var buttonOKFunction : [
		function_OK,
		function_Cancel
	]
	
	property var popupWidth: 450
	property var popupHeight: 390
	property var rectangleWidth: 440
	property var rectangleHeight: 380
	property var buttonWidth: rectangleWidth / 8
	property var buttonHeight: 40
	property var modelRow: 4
	property var modelCol: 6
	
	property var spacing1: 25
	property var spacing2: 15
	property var spacing3: 10
	property var spacing4: 20
	
	property var spacingAdd: 15
	
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
				width: parent.width - rectangleWidth / 4 + spacingAdd
				height: 40
				anchors.horizontalCenter: parent.horizontalCenter
				border.width: 2
				border.color: "lightblue"
				color: "white"
				
				TextInput
				{
					id: idTextEdit
					width: parent.width
					focus: true
					font.family: "Helvetica"
					font.pointSize: 20
					readOnly: true
//					inputMask: "9.99"
					maximumLength: 19
					inputMethodHints :Qt.ImhFormattedNumbersOnly
				}
			}
			
			Rectangle
			{
				id: idRectKeyboardSmall
				y: idRectText.height + spacing2
				width: parent.width - rectangleWidth / 4 + spacingAdd
				height: 40
				anchors.horizontalCenter: parent.horizontalCenter
				color: "black"
				
				RowLayout
				{
					id: idLayout1
					//y: idRectText.height + spacing2
					//anchors.horizontalCenter: parent.horizontalCenter
					anchors.left: parent.left
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
			//						border.color: parent.down ? Config.btnColorBorderDown : Config.btnColorBorderNormal
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
			}
			
			Rectangle
			{
				id: idRectKeyboardLarge
				y: idRectKeyboardSmall.y + idRectKeyboardSmall.height + spacing3
				width: parent.width - rectangleWidth / 4 + spacingAdd
				height: buttonHeight * modelRow + idLayout2.spacing * ( modelRow - 1 )
				anchors.horizontalCenter: parent.horizontalCenter
				color: "black"
				
				ColumnLayout
				{
					id: idLayout2
					//y: idLayout1.y + idLayout1.height + spacing3
					//anchors.horizontalCenter: parent.horizontalCenter
					anchors.left: parent.left
					width: idLayout1.width
					
					spacing: 4 
					
					Repeater {
						id: idRepeaterRow
						model: modelRow
						delegate: Row {
							spacing: 3
							
							Repeater {
								id: idRepeaterCol
								property int colIndex: index
								model: modelCol
								delegate: Button{
									property int buttonIndex: idRepeaterCol.colIndex * idRepeaterCol.model + index
									text: buttonTextNum[idRepeaterCol.colIndex * idRepeaterCol.model + index ]
									visible: buttonVisible[idRepeaterCol.colIndex * idRepeaterCol.model + index]
									contentItem: Text {
										text: buttonTextNum[idRepeaterCol.colIndex * idRepeaterCol.model + index ]
										font.family: "Helvetica"
										color: "white"
										opacity: enabled ? 1.0 : 0.3
										horizontalAlignment: Text.AlignHCenter
										verticalAlignment: Text.AlignVCenter
										elide: Text.ElideRight
										visible: buttonVisible[index]
									}

									background: Rectangle {
										implicitWidth: buttonWidth
										implicitHeight: buttonHeight
										radius: 5
										opacity: enabled ? 1 : 0.3
										color:"#212121"
				//						border.color: parent.down ? Config.btnColorBorderDown : Config.btnColorBorderNormal
										border.width: 1
										visible: buttonVisible[index]
									}
									
									onClicked:{
		//								console.log("Button Text:",text);
										console.log( "buttonVisible[",index,"] : ",buttonVisible[index] );
		//								idTextEdit.text = (idTextEdit.text.concat(text));

										buttonNumberFunction[buttonIndex](text);
									}
								}
								Component.onCompleted: console.log( "Repeater count: ",count);
								onItemAdded:{
									console.log( "colIndex.index:",idRepeaterCol.colIndex);
									console.log( "idRepeaterCol.index:",index);
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
			}
			
			Rectangle
			{
				id: idRectKeyboardOK
				y: idRectKeyboardLarge.y + idRectKeyboardLarge.height + spacing4
				width: parent.width - rectangleWidth / 4 + spacingAdd
				height: 40
				anchors.horizontalCenter: parent.horizontalCenter
				color: "black"
				
				RowLayout
				{
					id: idLayout3
					//y: idLayout2.y + idLayout2.height + spacing4
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
			//						border.color: parent.down ? Config.btnColorBorderDown : Config.btnColorBorderNormal
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
		idTextEdit.text = ""
	}
	
	function function_Add(text)
	{
		console.log("function_Add:",text);
		var strNumber = "";
		var str = "";
		
		console.log( "bReplace:",bReplace );
		if( bReplace )
		{
			bReplace = false;
			
			idTextEdit.text = text;
			return;
		}
		
		if( text == "SP" )
			str = idTextEdit.text.concat(" ");
		else
			str = idTextEdit.text.concat(text);
		
		idTextEdit.text = str
	}
	
	function function_Add_old(text)
	{
		console.log("function_Add:",text);
		var strNumber = "";
		var str = "";
		
		var strTemp = String(idTextEdit.text);
		var strAdd = String(text);
		
		var bAdd = true;
		
		console.log( "bReplace:",bReplace );
		if( bReplace )
		{
			bReplace = false;
			
			if( isValidNumber(text) )
			{
				idTextEdit.text = text;
			}
			else
			{
				console.log("invalid: invalid input while replacing.");
			}
			return;
		}
		
		var strSymbol = "";
		var bDot = false;
		var strBeforePoint = "";
		var strAfterPoint = "";
		
		//split symbol
		if(isSymbol(strTemp))
		{
			strSymbol = strTemp.charAt(0);
			strTemp = strTemp.substring(1,strTemp.length - 1);
			console.log("after cut symbol:",strSymbol);
			console.log("after cut str left:",strSymbol);
		}
		
		//split dot
		if( bDot = isDot(strTemp))
		{
			var dotIndex = 0;
			dotIndex = strTemp.search(/\./);
			strBeforePoint = strTemp.substring(0,dotIndex);
			strAfterPoint = strTemp.substring(dotIndex + 1,strTemp.length);
			console.log("strBeforePoint:",strBeforePoint);
			console.log("strAfterPoint:",strAfterPoint);
		}
		else
		{
			strBeforePoint = strTemp;
			console.log("strBeforePoint:",strBeforePoint);
			console.log("strAfterPoint:",strAfterPoint);
		}
		
		//number judge
		if( strTemp.search(/\./) >= 0 && text.search(/\./) >= 0 )
		{
			console.log("invalid:only one '.' allowed");
			bAdd = false;
		}
		else if( !bDot && Number(strBeforePoint) >= 0 && Number(strBeforePoint) <= 9 && Number(strAdd) >= 0 && Number(strAdd) <= 9 )
		{
			console.log("invalid:one significant digit allowed before the decimal point");
			bAdd = false;
		}
		else if( Number(strAfterPoint) >= 10 && Number(strAfterPoint) < 99 )
		{
			console.log("invalid:two significant digit allowed after the decimal point");
			bAdd = false;
		}
		else
		{
			bAdd = true;
		}
		console.log( "bAdd:",bAdd );
		
		if( bAdd )
		{
			console.log("function_Add add:",text);
			str = idTextEdit.text.concat(text);
		}
		else
		{
			console.log("input invalid , return");
			return;
		}
		
		idTextEdit.text = str;
	}
	
	function isSymbol( symbol )
	{
		var bSymbol = false;
		console.log("isSymbol:",symbol);
		if( symbol.charAt(0) == "+" || symbol.charAt(0) == "-" )
		{
			bSymbol = true;
			console.log("isSymbol:",bSymbol);
			return bSymbol;
		}
		else
		{
			bSymbol = false;
			console.log("isSymbol:",bSymbol);
			return bSymbol;
		}
	}
	
	function isDot( text )
	{
		var bDot = false;
		console.log("isDot:",text);
		if( text.search(/\./) >= 0 )
		{
			bDot = true;
			console.log("bDot:",bDot);
			return bDot;
		}
		else
		{
			bDot = false;
			console.log("bDot:",bDot);
			return bDot;
		}
	}
	
	function isValidNumber( number )
	{
		console.log("isValidNumber:",number);
		return Number(number);
	}
	
	function addSymbol( number )
	{
		console.log( "addSymbol:",number );
		var str = "";
		var strNumber = Number(number);
		if( strNumber >= 0  ){
			str = "+";
			return str.concat(strNumber);
		}
		else
		{
			str = "";
			return str.concat(strNumber);
		}
	}
	
	function reverseNumber( number )
	{
		console.log( "reverseNumber:",number );
		var str = "";
		var strSave = String(number);
		var strReturn = "";
		var strNumber = Number(number);
		console.log( "reverseNumber::strNumber:",strNumber );
		var strReverseValue = ( 0 - Number(number) );
		console.log( "reverseNumber::strReverseValue:",strReverseValue );
		if( strNumber > 0 ){
			strReturn = addSymbol(strReverseValue);
			return strReturn;
		}
		else if ( strNumber < 0 ){
			strReturn = addSymbol(strReverseValue);
			return strReturn;
		}
		else if ( strNumber == 0 )
		{
			strReturn = reverseSymbol( strSave );
			return strReturn;
		}
		else{}
	}
	
	function reverseSymbol( text )
	{
		console.log( "reverseSymbol:",text );
		var str = "";
		var strTemp = String(text);
		var strReturn = "";
		console.log( "reverseSymbol::substring",strTemp.substring( 0,1 ) );
		if( strTemp.charAt(0) == "+" )
		{
			str = "-";
			strReturn = str.concat( strTemp.substring( 1,strTemp.length ) );
			console.log( "reverseSymbol return:",strReturn );
			return strReturn;
		}
		else if( strTemp.charAt(0) == "-" )
		{
			str = "+";
			strReturn = str.concat( strTemp.substring( 1,strTemp.length ) );
			console.log( "reverseSymbol return:",strReturn );
			return strReturn;
		}
		else 
		{
			console.log( "reverseSymbol:there is no symbol to reverse" );
			return text;
		}
	}
	
	function function_OK()
	{
		console.log("function_OK:",6);

		strReturn = String(idTextEdit.text);
		console.log("strReturn:",strReturn);
		
		popup.close();
	}
	
	function function_Cancel()
	{
		console.log("function_Cancel:",7);

		strReturn = String(varStrOld);
		console.log("strReturn:",strReturn);
		
		popup.close();
	}
	
	function init() {
		var str = "";
		var strTemp = "";
		strTemp = strPutIn;//"-1";
		console.log("strPutIn:",strPutIn);
		varStrOld = strPutIn;
		idTextEdit.text = strTemp;
	}
	
}