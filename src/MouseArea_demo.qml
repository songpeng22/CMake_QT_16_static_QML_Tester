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
	color: "teal"
	
	Rectangle {
		width: 100; height: 100
		color: "green"

		MouseArea {
			anchors.fill: parent
			acceptedButtons: Qt.LeftButton | Qt.RightButton
			onClicked: {
				if (mouse.button == Qt.RightButton)
					parent.color = 'blue';
				else
					parent.color = 'red';
			}
		}
	}
}