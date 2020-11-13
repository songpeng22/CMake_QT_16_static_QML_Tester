import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

Window { 
	x: 0; 
	y: 0; 
	width: 800; 
	height: 600 
	flags: Qt.FramelessWindowHint | Qt.Window
	
	Rectangle
	{
		color: "tan"
		anchors.fill: parent
	}
}