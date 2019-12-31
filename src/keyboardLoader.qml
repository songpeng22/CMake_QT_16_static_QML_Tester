import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	id: idItemADCParameters
	objectName : "objItemADCParameters"
	width: 1000
	height: 800
	color: "black"	
	visible: true
	
	property var strFromKeyBoard = "";
	
	Rectangle{ anchors.fill: parent; color: "teal" }
	Rectangle { 
		id: idRectGFactor
		objectName : "objRectGFactor"
		Layout.alignment: Qt.AlignLeft
		width: parent.width
		height: 25
		color: "white"

		Label {
			id : idLabelGFactor
			objectName : "objTextGFactor"
			text: "g-factor(g/kg):"
			font.family: "Helvetica"
			font.pointSize: 11
			color: "black"
			anchors.left : parent.left
//			width: idLabelZeroSet.width
		}

		TextField {
			id: idTextEditGFactor
			objectName : "objTextEditGFactor"
			x: idLabelGFactor.width + 5
			width: parent.width - idLabelGFactor.width - idButtonSetGFactor.width - 10
//						anchors.left : idLabelGFactor.right
//						width: parent.width - idLabelGFactor.width - idButtonSetGFactor.width - 5
			height : 25
			background: Rectangle {
				implicitWidth: 200
				implicitHeight: 40
				border.color: "#e0e0e0"
			}
			
			MouseArea {
				anchors.fill: parent
				onClicked: { 
					console.log("onclicked:");
					idLoader.source = "keyboard.qml"
				}
			}
		}

		Button{
			id:idButtonSetGFactor
			objectName : "objButtonSetGFactor"
			text:"set g-factor"
			anchors.right : parent.right
			width: 140
			height: parent.height
			contentItem: Text {
				text: idButtonSetGFactor.text
				font: idButtonSetGFactor.font
				opacity: enabled ? 1.0 : 0.3
//				color: idButtonSetGFactor.down ? "white" : "teal"
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				elide: Text.ElideRight
			}

			background: Rectangle {
				implicitWidth: 100
				implicitHeight: 40
				opacity: enabled ? 1 : 0.3
//				color:idButtonSetGFactor.down ? Config.btnColorDown : Config.btnColorNormal
				border.width: 1
				radius: 2
			}
		}
	}

	Loader{
		id: idLoader
		
	}
}