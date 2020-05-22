import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	width: 600
	height: 400
	
	Button {
		text: "button"
		width: 100
		height: 40
		onClicked: popup.open()

		
	}
	
	Popup {
		id: popup
		x: Math.round((parent.width - width) / 2)
		y: Math.round((parent.height - height) / 2)
		width: 200
		height: 200		
		closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
	
		parent: Overlay.overlay   	//a parent layer covers entire window
		modal: true					//modal:not permit to operate parent window
		dim: true		
		Overlay.modal: Rectangle {	//if modal, could change color or its background
			color: "#aacfdbe7"
		}
		Overlay.modeless: Rectangle {// permit operation on parent window
			color: "#aacfdbe7"//"red"//"#aacfdbe7"
		}
		Overlay.onPressed:{
			console.log( "overlay pressed." );
		}
/**/

/*			
		//contentItem
		contentItem: Text {
			text: "Content"
		}
*/			
		//or
		
		//ColumnLayout
		ColumnLayout {
			anchors.fill: parent
			CheckBox { text: qsTr("E-mail") }
			CheckBox { text: qsTr("Calendar") }
			CheckBox { text: qsTr("Contacts") }
		}			
	}	
}
