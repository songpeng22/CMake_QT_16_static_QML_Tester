import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.1

Item
{
	width: 800
	height: 600
	
	Button
	{
		x: 0
		y: 0
		text: "test"
		onClicked:
		{
			messageDialog.open();
		}
	}
	
	MessageDialog {
		id: messageDialog
		title: "May I have your attention please"
		text: "It's so cool that you are using Qt Quick."
		onAccepted: {
			console.log("And of course you could only agree.")
//			Qt.quit()
		}
		Component.onCompleted: visible = false
	}
}

