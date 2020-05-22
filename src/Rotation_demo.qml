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
		x: 0
		y: 0
		width: 100; height: 100
		color: "blue"
		transform: Rotation { origin.x: 25; origin.y: 25; angle: -45}
	}
}
