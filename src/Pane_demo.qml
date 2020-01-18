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
	
	Pane {
		width: 120
		height: 120
		anchors.centerIn: parent

		Material.accent: Material.Orange
		Material.foreground: Material.Pink
		Material.background: Material.Teal
		Material.elevation: 6

		Label {
			color: "white"
			text: qsTr("I'm a card!")
			anchors.centerIn: parent
		}
	}
}