import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Qt.labs.folderlistmodel 2.1

GridLayout {
    width: 400; 
	height: 400
	columns: 2
	columnSpacing: 10//spaceValue
    rowSpacing: 10//spaceValue
	
	Repeater
	{
		id: repeater
		model: folderModel
		Rectangle {
//          Layout.preferredWidth: ( gridLayout.width - marginValue ) / 2
//          Layout.preferredHeight: 30
			Layout.fillWidth: true
			Layout.fillHeight: true
			Layout.alignment: Qt.AlignTop
			
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