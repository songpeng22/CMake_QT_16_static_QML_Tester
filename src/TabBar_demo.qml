import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Item {
    id:root
	objectName: "objItem"
    visible: true
    width: 800
    height: 600

	//Rectangle for TabBar
    Rectangle{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
        height:parent.height * 1 / 2
        width : parent.width

		//TabBar usage
		TabBar {
			id: idTab
			width: parent.width
//			height:parent.height
			TabButton {
				text: qsTr("Home")
			}
			TabButton {
				text: qsTr("Discover")
			}
			TabButton {
				text: qsTr("Activity")
			}
		}

		StackLayout {
			anchors.top:idTab.bottom
			width: parent.width
			implicitHeight: 200
			currentIndex: idTab.currentIndex
			Item {
				id: homeTab
				anchors.fill: parent
				Rectangle{ anchors.fill: parent; color: "magenta" }
				Component.onCompleted: console.log("homeTab height:",height);
			}
			Item {
				id: discoverTab
				anchors.fill: parent
				Rectangle{ anchors.fill: parent; color: "tan" }
				Component.onCompleted: console.log("discoverTab height:",height);
			}
			Item {
				id: activityTab
				anchors.fill: parent
				Rectangle{ anchors.fill: parent; color: "lime" }
				Component.onCompleted: console.log("activityTab height:",height);
			}
		}
        
    }
	
	Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
        height: parent.height / 2
        width : parent.width
		anchors.top:idRect1.bottom

    }

	Component.onCompleted:{
//		console.log("value" , Global.value());
	}
}
