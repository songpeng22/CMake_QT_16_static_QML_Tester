import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Flickable {
    width: parent.width
	height: parent.height
    contentWidth: parent.width
	contentHeight: parent.height * 2
	clip: true

    rebound: Transition {
        NumberAnimation {
            properties: "x,y"
            duration: 1000
            easing.type: Easing.OutBounce
        }
    }
	
	GridLayout
	{
		id: gridLayout
		
		anchors.fill: parent
//                layoutDirection: GridLayout.LeftToRight | GridLayout.TopToBottom
		columns: 2
		rows: 10
		columnSpacing: -spaceValue//spaceValue
		rowSpacing: -spaceValue//spaceValue

		Repeater
		{
			id: repeater
			model: 20
			Rectangle {
				Layout.preferredWidth: ( gridLayout.width - marginValue ) / 2
				Layout.preferredHeight: 20
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.margins: marginValue
				color: "#F0F0F0"
				border.color: borderColor
				
				gradient: Gradient {
					GradientStop { position: 0.0; color: "lightsteelblue" }
					GradientStop { position: 1.0; color: "blue" }
				}
			}
		}

		Component.onCompleted:
		{
			console.log( "gridLayout.width:",gridLayout.width );
			console.log( "gridLayout.height:",gridLayout.height );
		}

	}
	
	onFlickStarted:{
		console.log("onFlickStarted");
		
		
		
	}
	
	onFlickEnded:{
		console.log("onFlickEnded");
	}
	
	onMovementStarted:{
		console.log("onMovementStarted");
		
		//(widthRatio,heightRatio) is provided in ratio -> (0.5,0.5)
		//(xPosition,yPosition) is provided in ratio(0~0.5,0~0.5)
		console.log("Flickable::visibleArea.xPosition:",visibleArea.xPosition);
		console.log("Flickable::visibleArea.yPosition:",visibleArea.yPosition);
		console.log("Flickable::visibleArea.widthRatio:",visibleArea.widthRatio);
		console.log("Flickable::visibleArea.heightRatio:",visibleArea.heightRatio);
	}
	
	onMovementEnded:{
		console.log("onMovementEnded");
		
		console.log("Flickable::visibleArea.xPosition:",visibleArea.xPosition);
		console.log("Flickable::visibleArea.yPosition:",visibleArea.yPosition);
		console.log("Flickable::visibleArea.widthRatio:",visibleArea.widthRatio);
		console.log("Flickable::visibleArea.heightRatio:",visibleArea.heightRatio);
	}
}
