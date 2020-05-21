import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Row {
    spacing: 2
    Rectangle { 
		color: "red"; width: 150; height: 50

		Button
		{
			text: "Row1"
			
			onClicked:
			{

			}
		}
	}
    Rectangle { color: "green"; width: 120; height: 50 }
    Rectangle { color: "blue"; width: 150; height: 20 }
}