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
			id: idRepeater1
			model: 4		
			delegate: Row {
				property int nRepeatIndex1: index
				spacing: 3
				
				Repeater {
					id: idRepeater2
					model: 3
					delegate: Rectangle {
						//this nRepeatIndex2 can only be defined in content item of Repeater
						property int nRepeatIndex2: index
						width: 100; height: 40
						border.width: 1
						color: "#212121"
						radius: 5
						
						
						Button
						{
							contentItem: Text { 
								id: text
								anchors.centerIn: parent
								text: "Data" 
								color: "white"
							}
							
							onClicked:
							{
								console.log("index:",index);
								console.log("nRepeatIndex1:",nRepeatIndex1);
								console.log("nRepeatIndex2:",nRepeatIndex2);
								
							}
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