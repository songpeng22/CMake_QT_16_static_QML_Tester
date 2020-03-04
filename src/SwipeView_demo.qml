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
	
	SwipeView {
		id: view

		currentIndex: 1
		anchors.fill: parent
		orientation: Qt.Vertical

		Rectangle {
			id: firstPage
			color: "red"
		}
		Rectangle {
			id: secondPage
			color: "blue"
		}
		Rectangle {
			id: thirdPage
			color: "yellow"
		}
	}

	//three points at bottom , show index of the page
	PageIndicator {
		id: indicator

		count: view.count
		currentIndex: view.currentIndex

		anchors.bottom: view.bottom
		anchors.horizontalCenter: parent.horizontalCenter
		
		interactive: false //too small to interactive
		
		orientation: Qt.Vertical
	}
	
}