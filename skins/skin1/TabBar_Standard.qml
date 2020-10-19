import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4

TabBar
{
	Config
	{
		id: config
	}
//	implicitWidth: 600
	implicitHeight: config.varLineHeight
	
	background: Rectangle {
        color: config.bkColor
    }	

//	Material.theme: config.theme
//	Material.background: config.background
//	Material.foreground: config.foreground
//	Material.accent: Material.Green

	function select()
	{
		console.log("currentIndex:",currentIndex);
		console.log("count:",count);
		var i = 0;
		for(i=0;i<3;i++)
		{
			itemAt(i).bSelected = false;
		}
		currentItem.bSelected = true;			
	}
	
	Component.onCompleted: select();
}