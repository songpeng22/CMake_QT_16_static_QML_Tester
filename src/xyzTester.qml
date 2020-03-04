import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	id: root
	width: 600
	height: 400
	color: "teal"
	
	Rectangle {
        z: 1          //make z order bigger,than rectangle goes upper layer
        color: "red"
        width: 100; height: 100
    }
    Rectangle {
        color: "blue"
        x: 50; y: 50; width: 100; height: 100
    }
	
	Rectangle {
        color: "red"
		x:200
        width: 100; height: 100
    }
    Rectangle {
        color: "blue"
        x: 50 + 200; y: 50; width: 100; height: 100
    }
	
	x: isItem(root) ? (console.log("100"),100) : 0
	y: 0
	z: 1
	
	Text{
		anchors.centerIn: parent
		text: "test1"
	}
	
	function isItem(item) {
		var bItem = item instanceof Item;
		console.log("isItem:",bItem);
		return bItem;
	}

	function updateXY()
	{
		console.log("main.qml updateXY()");
		root.x = isItem(root) ? 0 : screen.virtualX + 20;
		root.y = isItem(root) ? 0 : 150;
		console.log("root.x:",root.x);
		console.log("root.y:",root.y);
	}
}