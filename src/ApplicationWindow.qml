import QtQuick 2.9
import QtQuick.Controls 2.3

ApplicationWindow {
	width: 800
	height: 600
	visible: true
//	flags: Qt.CustomizeWindowHint | Qt.WindowTitleHint | Qt.WindowCloseButtonHint
/**/
    menuBar: MenuBar {
		height: 8
        Menu {
            title: qsTr("&File")
            Action { text: qsTr("&New...") }
            Action { text: qsTr("&Open...") }
            Action { text: qsTr("&Save") }
            Action { text: qsTr("Save &As...") }
            MenuSeparator { }
            Action { text: qsTr("&Quit") }
        }
        Menu {
            title: qsTr("&Edit")
            Action { text: qsTr("Cu&t") }
            Action { text: qsTr("&Copy") }
            Action { text: qsTr("&Paste") }
        }
        Menu {
            title: qsTr("&Help")
            Action { text: qsTr("&About") }
        }
    }

    header: ToolBar {
        // ...
    }

    footer: TabBar {
        // ...
    }
	
	contentItem:
	{
		Rectangle
		{
			color: "tan"
			anchors.fill: parent		
		}
	}

    StackView {
        anchors.fill: parent
    }
}