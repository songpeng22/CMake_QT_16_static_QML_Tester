import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Window {
    id:root
	objectName: "objWindow1"
    visible: true
    width: 800
    height: 600
    title: qsTr("Hello World")

	//Rectangle for TabBar
    Rectangle{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
        height:parent.height * 1 / 2
        width : parent.width

		ComboBox {
			id: idComboCountry
			width: parent.width
			height : 30
			anchors.right : parent.right
			Component.onCompleted: console.log("idComboCountry height:",height);
			model:myModel
			onActivated:{
				console.log("onActivated");
				
			}
		}
		ComboBox {
			id: idComboLoadCapacity
			width: parent.width
			height : 30
			anchors.right : parent.right
			anchors.top : idComboCountry.bottom
			Component.onCompleted: console.log("idComboCountry height:",height);
			model:myModelLoad
		}
        
    }

    Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
        height: parent.height / 2
        width : parent.width
		anchors.top:idRect1.bottom

        
		ListView {
			width: 100; 
			height: 100

			model: myModel
			delegate: Rectangle {
				height: 25
				width: 100
				Text { text: myModel }
			}
		}


    }
/*	
    Rectangle{
        id:idRect3
        objectName : "objRect3"
        color: "plum"
        height: parent.height / 3
        width : parent.width
        anchors.top:idRect2.bottom

    }
*/
	Component.onCompleted:{
//		console.log("value" , Global.value());
	}
}
