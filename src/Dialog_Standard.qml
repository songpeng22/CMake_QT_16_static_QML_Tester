import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Dialog 
{
	Config
	{
		id: config
	}

	Material.background: Material.Red

/*	
	modality: dialogModal.checked ? Qt.WindowModal : Qt.NonModal
	title: customizeTitle.checked ? windowTitleField.text : "Hello"
	onButtonClicked: console.log("clicked button " + clickedButton)
	onAccepted: lastChosen.text = "Accepted " +
		(clickedButton == StandardButton.Ok ? "(OK)" : (clickedButton == StandardButton.Retry ? "(Retry)" : "(Ignore)"))
	onRejected: lastChosen.text = "Rejected " +
		(clickedButton == StandardButton.Close ? "(Close)" : (clickedButton == StandardButton.Abort ? "(Abort)" : "(Cancel)"))
	onHelp: lastChosen.text = "Yelped for help!"
	onYes: lastChosen.text = (clickedButton == StandardButton.Yes ? "Yeessss!!" : "Yes, now and always")
	onNo: lastChosen.text = (clickedButton == StandardButton.No ? "Oh No." : "No, no, a thousand times no!")
	onApply: lastChosen.text = "Apply"
	onReset: lastChosen.text = "Reset"
*/	
	
	Button
	{
		implicitWidth: 100
		implicitHeight: 40

		Material.background: Material.Teal
		
		text: "style"

		
	}

}