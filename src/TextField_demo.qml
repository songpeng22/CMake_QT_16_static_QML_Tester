import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "teal"
	
	TextField {
		id:idTextField
		anchors.left: parent.left
		horizontalAlignment: TextInput.AlignHCenter
		placeholderText: qsTr("Enter name")
		inputMask: "0000.00"  //limit input
		maximumLength: 7
		readOnly: true
		inputMethodHints: Qt.ImhFormattedNumbersOnly //restrict qt input method
		echoMode: TextInput.Normal //TextInput.Normal,TextInput.Password,TextInput.NoEcho
//		displayText: /*read-only*/ //if echoMode is password , displayText shows *** , whereas text shows real content

//		canPaste: false  //read-only
		
		background: Rectangle {
			implicitWidth: 100
			implicitHeight: 40
			
			//border.color: "#333"
			border.width: 2		
			border.color: parent.readOnly ? "#D4D4D4" : "lightblue" 
			color: parent.readOnly ? "#F0F0F0" : "white"
		}
	}
	
	Button
	{
		id:button
		text: "show and reverse"
		anchors.left: idTextField.right
		implicitWidth: 200
		implicitHeight: 40		
		onClicked:
		{
			console.log("TextField::displayText:",idTextField.displayText);
			console.log("TextField::text:",idTextField.text);
			console.log("TextField::cursorPosition:",idTextField.cursorPosition );
			
			idTextField.readOnly = !idTextField.readOnly;
		}
	}
}