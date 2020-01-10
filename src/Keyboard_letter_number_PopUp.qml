import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle {
    id: root
    width: 800
    height: 600
    visible: true
	
	TextField
	{
		id: idTextField
		y: 10
		text: "00.00"
		MouseArea {
			anchors.fill: parent
			onClicked: { 
				keyboard.open()
			}
		}
	}

    Button {
		y: 50
        text: "Open"
        onClicked: keyboard.open()
    }
	
	

    Keyboard_letter_number
	{
		id: keyboard
//		anchors.centerIn: parent   //popup do not support anchors in Qt5.10
		x: (root.width - width) / 2
        y: (root.height - height) / 2
		
		onOpened:{
			console.log("onOpened:",idTextField.text);
			
		}
		onAboutToShow:{
			console.log("onAboutToShow:",idTextField.text);
			keyboard.strPutIn = idTextField.text;
			keyboard.init();
		}
		onAboutToHide:
		{
			console.log("onAboutToHide");
			console.log("keyboard return:"+ keyboard.strReturn);
			idTextField.text = keyboard.strReturn;
		}
	}
}