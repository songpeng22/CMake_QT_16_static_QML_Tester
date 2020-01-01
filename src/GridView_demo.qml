import QtQuick 2.0

Rectangle {
    width: 300; height: 200
	
	ListModel {
        id: idListModel
        ListElement {
            name: "Jim Williams"
 //			portrait: "pics/portrait.png"
        }
        ListElement {
           name: "John Brown" 
//			portrait: "pics/portrait.png"
        }
        ListElement {
            name: "Bill Smyth"
 //			portrait: "pics/portrait.png"
        }
        ListElement {
            name: "Sam Wise"
 //			portrait: "pics/portrait.png"
        }
	}


    Component {
        id: contactDelegate
        Item {
            width: grid.cellWidth; height: grid.cellHeight
            Column {
                anchors.fill: parent
                Rectangle { 
					color:"lime"; width:60;height:60; 
					anchors.horizontalCenter: parent.horizontalCenter 
					Text{ text:"person"; anchors.centerIn:parent; }
				}
                Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
            }
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 80; cellHeight: 80

        model: idListModel
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }
}
