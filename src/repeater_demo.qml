import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Item {
	id: item
	width: 800
	height: 600
	
	Column {
        id: col
		spacing: 3
		
		Repeater {
			model: 4
			delegate: Row {
				spacing: 3
				
				Repeater {
					model: 3
					delegate: Rectangle {
						width: 100; height: 40
						border.width: 1
						color: "#212121"
						radius: 5
						Text { 
							id: text
							anchors.centerIn: parent
							text: "Data" 
							color: "white"
							
						}
					}
					Component.onCompleted: console.log( "Repeater count: ",count);
				}
			}
			Component.onCompleted: console.log( "Repeater count: ",count);
			onItemAdded:{
				console.log( "onItemAdded.");
			}
		}
	}
}