import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Qt.labs.folderlistmodel 2.1

Rectangle
{
    width: 400; 
	height: 400
	border.color: "magenta"
	
	Grid {
		anchors.fill: parent
		columns: 2
		padding: 10
		columnSpacing: 10//spaceValue
		rowSpacing: 10//spaceValue
		
		Repeater
		{
			id: repeater
			model: folderModel
			Rectangle {
			  width: 100  //difference with GridLayout , do not use much space as it have
			  height: 30  //difference with GridLayout , do not use much space as it have
			  Layout.preferredWidth: 40
			  Layout.preferredHeight: 30
	//			Layout.fillWidth: true
	//			Layout.fillHeight: true
				
				Text
				{
					anchors.fill: parent
					text: fileName
				}

				Layout.margins: 10
				color: "#F0F0F0"
				border.color: "red"
			}
		}
		FolderListModel {
			id: folderModel
			folder: "../"
	//		folder: "file:///C:/"
			showDirs: true
			showFiles: true

	//        nameFilters: ["*.qml"]
		}

	}	
}
