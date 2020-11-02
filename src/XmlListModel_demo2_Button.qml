import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0

Item
{
	width: 800
	height: 600
	
	XmlListModel {
		id: xmlModel
		source: "XmlListModel_demo2.xml"
		query: "/parameterStore"

		XmlRole { name: "variable_name"; query: "variable[1]/@name/string()" }
		XmlRole { name: "key_name"; query: "key/@name/string()" }
		XmlRole { name: "key_key_name1"; query: "key/key[1]/@name/string()" }

	}
	
	Button
	{
		x: 0
		y: 100
		text: "test"
		onClicked:
		{
			console.log(xmlModel.get(0).variable_name);
			console.log(xmlModel.get(0).key_name);
			console.log(xmlModel.get(0).key_key_name1);
		}
	}
/*
	Text
	{
		x: 0
		y: 200
		text: xmlModel.get(0).name
	}
*/	
	Component.onCompleted:
	{
//		console.log(xmlModel.get(0).name);   //can not get 
	}
}
