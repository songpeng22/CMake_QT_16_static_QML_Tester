import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Button
{
	Config
	{
		id: config
	}
	implicitWidth: 100
	implicitHeight: 40

//	Material.theme: config.theme
	Material.background: config.background
	
}