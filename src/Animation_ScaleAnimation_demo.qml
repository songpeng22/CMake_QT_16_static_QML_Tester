import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle {
    id: scalingBox
    width: 500
    height: 600
    color: "white"
	
	Rectangle
	{
		id: rectTop
		width: 500
		height: 500
		color: "lightsteelblue"
		
		ScaleAnimator {
			id: scaleAnimation
			target: rectTop;
			from: 0;
			to: 1;
			duration: 1000
			running: true
		}
	}
	
	Rectangle
	{
		id: rectCenter
		width: 500
		height: 100
		anchors.top: rectTop.bottom
		
		Button
		{
			text: "test"
			onClicked:
			{
				if( scaleAnimation.from === 0 )
				{
					scaleAnimation.from = 1;
					scaleAnimation.to = 0;	
					scaleAnimation.running = true;				
				}
				else
				{
					scaleAnimation.from = 0;
					scaleAnimation.to = 1;	
					scaleAnimation.running = true;
				}

			}
		}
		
	}

}