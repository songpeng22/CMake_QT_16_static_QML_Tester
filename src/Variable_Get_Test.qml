import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "teal"
	
	Variable_Get
	{
		id: variable
	}

	Button
	{
		text:"Click"
		onClicked:
		{
			//get id from "some new var" in "Variable_Get.qml"
			variable.idVariable_Get.doSomething();
			//fail to get id as a sub item
//			variable.idVariable_Get.idText.text = "heiheihei";
			//get id from "getId function" in "Variable_Get.qml"
			variable.getId("objVariable_Get").doSomething();
			//very success from getId function
			variable.getId("objText").text = "heiheihei";
		}
	}
}