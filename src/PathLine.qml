import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Shapes 1.0

Rectangle
{
	id: rectMain
	width: 600
	height: 400
	color: "white"
	
	Shape
	{
		ShapePath {
			strokeColor: "black"
			strokeWidth: 2
			fillColor: "transparent"
			capStyle: ShapePath.RoundCap

			property int joinStyleIndex: 0

			property variant styles: [  ShapePath.BevelJoin,
										ShapePath.MiterJoin,
										ShapePath.RoundJoin
									 ]

			joinStyle: styles[joinStyleIndex]

			startX: rectMain.width / 2
			startY: 0
			PathLine { x: rectMain.width / 2; y: rectMain.height }
			PathLine { x: 0; y: rectMain.height / 2 }
		}
	} 
}