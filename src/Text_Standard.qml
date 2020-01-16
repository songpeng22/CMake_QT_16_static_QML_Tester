import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Item
{
	property var varText: ""
	property var varFontFamily: "Helvetica"
	property var varFontSize: 9
	property var varColor: "black"
	

	Text
	{
		anchors.centerIn: parent
		
		text: varText
		font.family: varFontFamily
		font.pointSize: varFontSize
		color: varColor
	
	}
}
