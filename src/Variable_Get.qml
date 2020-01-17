import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: idItemKeyBoard
	objectName: "objVariable_Get"
	width: 600
	height: 400
	color: "teal"

	property var idVariable_Get: 0

	function getId( objectName )
	{
		if( objectName == "objVariable_Get" )
			return idItemKeyBoard;
		if( objectName == "objText" )
			return idText;
	}

	function doSomething()
	{
		console.log("doSomething.\n");
	}

	Text_Standard
	{
		id: idText
		objectName: "objText"
		text:"Hello"
	}
	
	Component.onCompleted:
	{
		idVariable_Get = idItemKeyBoard;
	}
}