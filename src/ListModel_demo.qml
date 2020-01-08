import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.1

Rectangle {
    width: 300; height: 600
	
	Rectangle
	{
		id:idRect1
		width: 300; height: 200
		
		ListModel {
			id: fruitModel
			 ListElement {
				name: "Apple"
				cost: 2.45
			}
			ListElement {
				name: "Orange"
				cost: 3.25
			}
			ListElement {
				name: "Banana"
				cost: 1.95
			}
		}

		Component {
			id: fruitDelegate
			Row {
				spacing: 10
				Text { text: name }
				Text { text: '$' + cost }
			}
		}

		ListView {
			anchors.fill: parent
			model: fruitModel
			delegate: fruitDelegate
		}
	}
	
	Rectangle
	{
		id:idRect2
		width: 300; height: 200
		anchors.top:idRect1.bottom
		
		Button
		{
			text:"Test1"
			onClicked:
			{
				fruitModel.append({"cost": 5.95, "name":"Pizza"})
			}
			
		}
	}

    
	
	
}