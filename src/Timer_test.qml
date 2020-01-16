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
	
	property var index: 0
	
	Text 
	{
		id: idText
		font.family: "Helvetica"
		font.pointSize: 20
	}
	
	Timer {
		id: idTimerGetValue
		objectName : "objTimerGetValue"
        interval: 50; 
		running: true; 
		repeat: true
        onTriggered: {
			var str = "";
			index = index + 1;
			str = str + index;
			idText.text = str;
		
		}
    }
}