import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0

Item
{
	width: 800
	height: 600
	
	XmlListModel {
		id: xmlModel
		source: "XmlListModel_demo.xml"
		query: "/rss/channel/item"

		XmlRole { name: "title"; query: "title/string()" }
		XmlRole { name: "pubDate"; query: "pubDate/string()" }
	}
	
	ListView {
		width: 180; height: 300
		model: xmlModel
		delegate: Text { text: title + ": " + pubDate }
	}

	
	Component.onCompleted:
	{
//		console.log(xmlModel.get(0).title);   //can not get , due to timing
	}
}
