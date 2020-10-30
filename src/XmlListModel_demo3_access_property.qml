import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0

Item
{
	width: 800
	height: 600
	
	XmlListModel {
		id: xmlModel
		source: "XmlListModel_demo3.xml"
		query: "/rss/channel/item"

		XmlRole { name: "title"; query: "title/string()" }
		XmlRole { name: "key"; query: "key/string()" }
		XmlRole { name: "name"; query: "key/@name/string()" }
	}

	
	Button
	{
		x: 0
		y: 100
		text: "test"
		onClicked:
		{
			console.log("title:",xmlModel.get(0).title);
			console.log("name:",xmlModel.get(0).name);
		}
	}
	
	Component.onCompleted:
	{
//		console.log(xmlModel.get(0).title);   //can not get 
	}
}
