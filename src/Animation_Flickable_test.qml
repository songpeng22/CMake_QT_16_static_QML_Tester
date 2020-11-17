import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle
{
	width: 600; height: 400
	
	Flickable {
		id: flick
		width: 150; height: 150
		contentWidth: 150; contentHeight: 300
//			visibleArea.xPosition: 0
//			visibleArea.yPosition: 0
//			visibleArea.widthRatio: 1.0
//			visibleArea.heightRatio: 1.0

		clip: true
		interactive: false
		
		anchors.margins: 10
		anchors.leftMargin: 10
		anchors.topMargin: 10
		anchors.rightMargin: 10
		anchors.bottomMargin: 10
		
		Rectangle {
			width: 150; height: 300
			Rectangle
			{
				x:0; y:0
				width: 150; height: 150
				color: "red"
			}
			
			Rectangle
			{
				x:0; y:150
				width: 150; height: 150
				
				color: "darkblue"
			}				
		}
		
		Behavior on contentY { PropertyAnimation { easing.type: Easing.OutCubic; duration: 900; } }
		
		Component.onCompleted:
		{
			console.log( "visibleArea.xPosition:",visibleArea.xPosition );
			console.log( "visibleArea.yPosition:",visibleArea.yPosition );			
			console.log( "visibleArea.widthRatio:",visibleArea.widthRatio );
			console.log( "visibleArea.heightRatio:",visibleArea.heightRatio );
		}
	}

	
	Button
	{
		text: "flickable animation"
		y: 200
		onClicked:
		{
			if( flick.contentY === 0 )
				flick.contentY = 150;
			else
				flick.contentY = 0;
		}
	}

}

