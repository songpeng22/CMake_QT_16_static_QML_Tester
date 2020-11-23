import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: questionDialog
	
	signal yes();
	signal no();
	y: 100
	Button
	{
		id: button1
		width: 100
		x: 0;
		text: "yes"
		onClicked:
		{
			questionDialog.yes();
		}
	}
	
	Button
	{
		id: button2
		width: 100
		x: 150
		text: "no"
		onClicked:
		{
			questionDialog.no();
		}		
	}
}