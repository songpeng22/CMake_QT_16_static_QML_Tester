import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "white"
	ScrollView {
		id: view
		//anchors.fill: parent
		width: parent.width
		height: 200
		TextArea {
			id : idTextResult
			objectName: "objTextResult"
			text: "hello world \n1...\n2...\n3...\n4...\n5...\n6...\n7...\n8...\n9..."
//			textColor: "orange"
			font.family: "Helvetica"
			font.pointSize: 11
			anchors.left : parent.left
			width: parent.width
			height: parent.height
//			backgroundVisible: false
			background: Rectangle {
				implicitWidth: 200
				implicitHeight: 40
//				color:"#AFEBE5"
				color: "transparent"
//				border.color: "#21be2b"//control.enabled ? "#21be2b" : "transparent"
			}

//			wrapMode: Text.WordWrap 
			Component.onCompleted: console.log("idTextCapacity width:",width);
		}
	}

	Button{
		text:"refresh"
		anchors.top: view.bottom
		onClicked:{
			idTextResult.cursorPosition = idTextResult.text.length - 1;
		}
	}
}