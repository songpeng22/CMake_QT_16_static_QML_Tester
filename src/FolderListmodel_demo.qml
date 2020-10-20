import QtQuick 2.9
import Qt.labs.folderlistmodel 2.1

ListView {
    width: 200; height: 400

    FolderListModel {
        id: folderModel
		folder: "../"
//		folder: "file:///C:/"
		showDirs: true
		showFiles: true

//        nameFilters: ["*.qml"]
    }

    Component {
        id: fileDelegate
        Text 
		{ 
			text: filePath 
			color: "red"
		}
    }

    model: folderModel
    delegate: fileDelegate
}