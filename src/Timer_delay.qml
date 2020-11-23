import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "teal"
	
	property var index: 0
	property var status: 0
	
	Text 
	{
		id: idText
		font.family: "Helvetica"
		font.pointSize: 20
	}
	
	Timer {
		id: timer
		function setTimeout(cb, delayTime) {
			timer.interval = delayTime;
			timer.repeat = false;
			timer.triggered.connect(cb);
			timer.triggered.connect(function release () {
				timer.triggered.disconnect(cb); // This is important
				timer.triggered.disconnect(release); // This is important as well
			});
			timer.start();
		}
		
		function repeatCheck(cb, delayTime) {
			timer.interval = delayTime;
			timer.repeat = true;
			timer.triggered.connect(cb);
//			timer.triggered.connect(function release () {
//				timer.triggered.disconnect(cb); // This is important
//				timer.triggered.disconnect(release); // This is important as well
//			});
			timer.start();
		}
	}
	
	Button
	{
		text: "delay test"
		y: 100
		onClicked:
		{
			console.log("+test");
//			timer.setTimeout(function(){ console.log("triggered"); }, 1000);
			timer.repeatCheck(function(){ if(status){ console.log("status:",status);timer.stop(); }else{ console.log("status:",status); } }, 1000);
			console.log("-test");
		}
	}
	
	Button
	{
		text: "set state"
		y: 200
		onClicked:
		{
			status = 1;
		}
	}
	
	Button
	{
		text: "clear state"
		x: 100; y: 200
		onClicked:
		{
			status = 0;
		}
	}
}