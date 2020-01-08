import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle {
    width: 800; height: 600
	
	ListModel {
        id: idListModel
        ListElement {
            name: "Jim Williams"
        }
        ListElement {
           name: "John Brown" 
        }
        ListElement {
            name: "Bill Smyth"
        }
        ListElement {
            name: "Sam Wise"
        }
	}

    Component {
        id: contactDelegate
        Item {
            width: grid1.cellWidth; height: grid1.cellHeight
            Column {
                anchors.fill: parent
                Rectangle { 
					color:"lime"; width:60;height:60; 
					anchors.horizontalCenter: parent.horizontalCenter 
					Text{ text:"person"; anchors.centerIn:parent; }
				}
                Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
            }
			
//			scale:0
			GridView.onAdd:
			{
				console.log("GridView1::onAdd:",index);
			}
			
			GridView.onRemove: SequentialAnimation {
				PropertyAction { target: grid1; property: "GridView.delayRemove"; value: true }
				NumberAnimation { target: grid1; property: "scale"; to: 0; duration: 250; easing.type: Easing.InOutQuad }
				PropertyAction { target: grid1; property: "GridView.delayRemove"; value: false }
			}
				
			
        }
    }
	
	Rectangle{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
	    width : 300	
        height: 200
		x: 100
/**/	
		GridView {
			id: grid1
			anchors.fill: parent
			cellWidth: 80; cellHeight: 80

			model: idListModel
			delegate: contactDelegate
			highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
			focus: true
			
			add: Transition {
				NumberAnimation { properties: "x,y"; from: 100; duration: 1000 }
			}
/*			
			remove: Transition {
				ParallelAnimation {
					NumberAnimation { property: "opacity"; to: 0; duration: 1000 }
					NumberAnimation { properties: "x,y"; to: 100; duration: 1000 }
				}
			}
*/			
		}
	
    }
	
	Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
	    width : 300	
        height: 200
		x: 100
		y: idRect1.height + 30
//		anchors.left: parent.left
//		anchors.top:idRect1.bottom

		GridView {
			id: grid2
			anchors.fill: parent
			cellWidth: 80; cellHeight: 80

			model: idListModel
//			highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
			focus: true
			
			delegate:Item {
				Column {
					anchors.fill: parent
					Rectangle { 
						color:"lime"; width:60;height:60; 
						anchors.horizontalCenter: parent.horizontalCenter 
						Text{ text:"person"; anchors.centerIn:parent; }
					}
					Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
					
					GridView.onAdd:
					{
						console.log("GridView2::onAdd:");
					}
				}
				
//				scale: 0 /* When a delegate is created, scale is initially zero */
				GridView.onAdd:
				{
					console.log("GridView::onAdd:",index);
				}
				
				GridView.onRemove:
				{
					console.log("GridView2::onRemove:",index);
				}
			}
		}
    }

    Rectangle{
        id:idRect3
        objectName : "objRect3"
        color: "teal"
	    width : 300	
        height: 200
		y: idRect2.y + idRect2.height + 10

		Button{
			id:idButton1
			text:"add to GridView"
			onClicked:
			{
				idListModel.append({"name":"Pizza"});
			}
		}
		Button{
			x: idButton1.width + 10
			text:"remove from GridView"
			onClicked:
			{
				console.log("idListModel.count:",idListModel.count);
				idListModel.remove( idListModel.count - 1 );
			}
		}
	}
}
