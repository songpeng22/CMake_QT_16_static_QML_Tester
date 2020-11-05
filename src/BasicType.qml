import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1

Item
{
	width: 800
	height: 600
	
	property var buttonArray : []
	property var i;
	
	Button
	{
		id: button
		text:"test"
		
	}
	
	Component.onCompleted:
	{
		//BasicType array push
		buttonArray.push(button);
		
		console.log( "buttonArray.length:",buttonArray.length );
		console.log("button id is :",button);
		console.log("button text is :",button.text);
		for( i=0;i<buttonArray.length;i++ )
		{
			console.log("item is :",buttonArray[i]);
			console.log("item.property is :",buttonArray[i].text);
		}
	}
	
	Component.onDestruction:
	{
		//BasicType array push
		buttonArray.length = 0;
		
		console.log("Component.onDestruction");
	}
}
