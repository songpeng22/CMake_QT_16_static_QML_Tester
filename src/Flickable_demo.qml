import QtQuick 2.0

Flickable {
    width: 150; height: 150
    contentWidth: 300; contentHeight: 300

    rebound: Transition {
        NumberAnimation {
            properties: "x,y"
            duration: 1000
            easing.type: Easing.OutBounce
        }
    }

    Rectangle {
        width: 300; height: 300
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "blue" }
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
