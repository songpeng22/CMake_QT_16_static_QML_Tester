import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Window {
    id:root
	objectName: "objWindow1"
    visible: true
    width: 600
    height: 400
    title: qsTr("Hello World")

    Rectangle{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
        height: parent.height / 2
        anchors.left : parent.left
        anchors.right : parent.right

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
        color: "plum"
        height: parent.height / 2
        anchors.left : parent.left
        anchors.right : parent.right
        anchors.top:idRect1.bottom

		ListView {
			width: 100; 
			height: 100
			anchors.top: idComboLoadCapacity.bottom

			model: myModel
			delegate: Rectangle {
				height: 25
				width: 100
				Text { text: myModel }
			}
		}
    }

	Component.onCompleted:{
		console.log("value" , Global.value());
	}
}
