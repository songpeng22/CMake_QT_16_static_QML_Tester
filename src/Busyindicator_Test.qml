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
	color: "red"
	
	Text
	{
		text:"Hello"
		font.pointSize: 24
	}
	
	BusyIndicator_Style
	{
		id: idBusyIndicator
		z:2                //upmost
		anchors.centerIn: parent
	}
	
	//make z order of Button bigger than MouseArea , than Button can be clicked
	Button
	{
		text:"Click"
//		x: 0
//		y: 100
		z:1					//bigger means uppper
		anchors.bottom: parent.bottom
		anchors.horizontalCenter:parent.horizontalCenter
		width: 100
		height: 40
		enabled: true
		onClicked: {
			console.log("Button clicked.");
			idBusyIndicator.running = !idBusyIndicator.running;
			if( idBusyIndicator.running )
			{
				idBusyIndicator.z = 2;
				idMaskArea.z = 0;
			}
			else
			{
				idBusyIndicator.z = -1;
				idMaskArea.z = -1;			
			}
		}
	}
	
	MouseArea {
		id: idMaskArea
		z:0					//smaller
		anchors.fill: parent
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		Rectangle
		{
			anchors.fill: parent
			color:"white"
			opacity: 0.9
		}
		onClicked: {
			console.log("MouseArea clicked.");
			onClicked: console.log("MouseArea z:",z);
		}
	}
}