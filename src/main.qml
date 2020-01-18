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
    Rectangle
	{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
        height:parent.height * 1 / 2
        width : parent.width

		ComboBox {
			id: idComboCountry
			objectName : "objComboCountry"
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
			objectName : "objComboLoad"
			width: parent.width
			height : 30
			anchors.right : parent.right
			anchors.top : idComboCountry.bottom
			Component.onCompleted: console.log("idComboCountry height:",height);
			model:myModelLoad
		}
        
    }

    Rectangle_Standard
	{
        id:idRect2
        objectName : "objRect2"
        color: "blue"
        height: parent.height * ( 1 / 2 - 1 / 10 )
        width : parent.width
		anchors.top:idRect1.bottom




    }
	Rectangle_Standard
	{
        id:idRect3
        objectName : "objRect3"
		anchors.top:idRect2.bottom
		height: parent.height / 10
        width : parent.width
        color: "white"
        
		Button
		{
			anchors.fill: parent
			text:"Exit"
			highlighted: true
			Material.background: Material.Teal
		}




    }

	function setProperty( objectName,name,value )
    {
        console.log( "setProperty::objectName:" + objectName + ",name:" + name + ",value:" + value );
		console.log( "idComboCountry:",idComboCountry );
		if( objectName == "objComboCountry" && name == "visible" )
			idComboCountry.visible = Boolean(value);
		if( objectName == "objComboLoad" && name == "visible" )
			idComboLoadCapacity.visible = Boolean(value);

        return "some return value"
    }

	Component.onCompleted:{
//		console.log("value" , Global.value());
	}
}
