import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "teal"
	
	CheckBox
	{
		id: idCheckBox
		checked: true
		enabled: false
		
		onClicked:
		{
			console.log("onClicked::checked:",idCheckBox.checked);
		}
		
		onPressed:
		{
			console.log("onPressed::checked:",idCheckBox.checked);
		}
		
		onReleased:
		{
			console.log("onReleased::checked:",idCheckBox.checked);
		}
		
		onToggled:
		{
			console.log("onToggled::checked:",idCheckBox.checked);
		}
		
		onPressAndHold:
		{
			console.log("onPressAndHold::checked:",idCheckBox.checked);
		}
		
		onDoubleClicked:
		{
			console.log("onDoubleClicked::checked:",idCheckBox.checked);
		}
	}
}