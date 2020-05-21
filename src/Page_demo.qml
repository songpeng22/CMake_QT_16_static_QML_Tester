import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0


Row {
    spacing: 2
    Rectangle { 
		color: "red"; width: 50; height: 50 
		Button
		{
			text: "row1"
			
			onClicked:
			{
				console.log("row index:",index);
			}
		}
	}
    Rectangle { 
		color: "green"; width: 20; height: 50 
		Button
		{
			text: "row2"
			
			onClicked:
			{
				console.log("row index:",index);
			}
		}
	}
    Rectangle { 
		color: "blue"; width: 50; height: 20 
		Button
		{
			text: "row3"
		}
	}
}