import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.0

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "black"
	
	TextField_Standard
	{
		readOnly: true
		text:"TextField"
	}
}