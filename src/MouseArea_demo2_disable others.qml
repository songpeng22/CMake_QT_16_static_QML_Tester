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
	
	Busyindicator_demo
	{
	
	}
	
	//make z order of Button bigger than MouseArea , than Button can be clicked
	Button
	{
		text:"Click"
		x: 0
		y: 100
		z:1                 //bigger
		width: 100
		height: 40
		enabled: true
		onClicked: {
			console.log("Button clicked.");
			console.log("Button z:",z);
		}
	}
	
	MouseArea {
//		x:200
//		y:200
		z:0					//smaller
//		width:200
//		height:200
		anchors.fill: parent
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		onClicked: {
			console.log("MouseArea clicked.");
			onClicked: console.log("MouseArea z:",z);
		}
	}
}