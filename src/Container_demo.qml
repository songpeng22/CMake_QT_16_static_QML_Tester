import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: idContainer
	width: 600
	height: 400
	color: "white"
	
	Container {
		id: container
		width: 200
		height: 100
/**/
		contentItem: ListView {
			model: container.contentModel   //put container's model into listview model 
			snapMode: ListView.SnapOneItem  //move one page at a time
			orientation: ListView.Horizontal
		}

		Rectangle{
			width: container.width
			height: container.height		
			color:"tan"
			Text {
				text: "Page 1"
				width: container.width
				height: container.height
			}
		}
		Rectangle{
			width: container.width
			height: container.height		
			color:"violet"
			Text {
				text: "Page 2"
				width: container.width
				height: container.height
			}
		}
		
		Rectangle{
			width: container.width
			height: container.height		
			color:"cyan"
			Text {
				text: "Page 3"
				width: container.width
				height: container.height
			}
		}
	}
	
	Component.onCompleted:
	{
		console.log("container:count:",container.count);
	}
}