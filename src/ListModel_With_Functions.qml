import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.1

Rectangle {
    width: 300; height: 600
	
	ListView{
		anchors.fill: parent
		orientation: ListView.Horizontal

		model: myModel

		delegate:
		Rectangle {
//			anchors.fill: parent
			width: 50
			height:50
			color: "red"
			Text {
				anchors.centerIn: parent
				text: label
			}
			MouseArea {
				anchors.centerIn: parent
				width: 30
				height: parent.height
				onClicked: {
					myModel.actions[label]();
				}
			}
		}
	}

	ListModel {
		id: myModel

		property var actions : {
			"New": function(){ console.log("New clicked!"); },
			"Old": function(){ console.log("Old clicked!"); },
			"Third": function(){ console.log("Third clicked!"); },
		}

		ListElement {
			label: "New"
		}
		
		ListElement {
			label: "Old"
		}
		
		ListElement {
			label: "Third"
		}
	}
}