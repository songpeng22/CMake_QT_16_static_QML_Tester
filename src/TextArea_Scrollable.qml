import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

ScrollView {
	width: parent.width
//	height: 200

	property var text: ""
	property var varText: text

	TextArea {
		id : textArea
		objectName: "objTextResult"
		text: varText//"hello world \n1...\n2...\n3...\n4...\n5...\n6...\n7...\n8...\n9..."
		font.family: "Helvetica"
		font.pointSize: 11
		anchors.left : parent.left
		width: parent.width
		height: parent.height
		background: Rectangle {
			implicitWidth: 200
			implicitHeight: 40
			color: "transparent"
		}

		wrapMode: TextEdit.Wrap 

		onTextChanged:
		{
			console.log("onTextChanged");
			textArea.cursorPosition = textArea.text.length - 1;
		}

		Component.onCompleted: console.log("idTextCapacity width:",width);
	}
}