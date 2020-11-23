import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import "utils.js" as MyScript

Item
{
	width: 400; height: 200
	
	Button
	{
		text: "test"
		onClicked:{
			console.log("+test");
			MyScript.delay(3000);
			console.log("-test");
		}
	}
}