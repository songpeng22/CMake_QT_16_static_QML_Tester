import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle {
	id: root
    width: 100; height: 200
    color: "white"
	
	SwipeView {
		id: view

		width: 100; height: 100
		
		currentIndex: 0
		anchors.fill: parent
		orientation: Qt.Vertical
//		interactive: false

		Rectangle {
			id: firstPage
			color: "red"
		}
		Rectangle {
			id: secondPage
			color: "blue"
		}
		
		Behavior on currentIndex {
			NumberAnimation { duration: 2000 }
		}
	}
/*	
	Rectangle {
		id: rect
		width: 100; height: 100
		color: "red"

		Behavior on width {
			NumberAnimation { duration: 1000 }
		}
	}
*/	

	Button
	{
		text:"animation"
		y: 100
		onClicked:
		{
			if( view.currentIndex === 0 )
			{
				view.currentIndex = 1;
			}
			else if( view.currentIndex === 1 )
			{
				view.currentIndex = 0;
			}
			else{}
		}
	}
}
