import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Item
{
	width: 600; height: 500
		
	Rectangle {
		width: 100; height: 100
		color: "blue"
		transform: Scale { origin.x: 0; origin.y: 0; xScale: 2; yScale: 1 }
	}
}
