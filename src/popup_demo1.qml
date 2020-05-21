import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle {
    id: root
    width: 800
    height: 400
    visible: true

    Button {
        text: "Open"
        onClicked: popup.open()
    }

    Popup {
        id: popup
        x: (root.width - width) / 2
        y: (root.height - height) / 2
        width: 200
        height: 300
		margins: 0
		padding: 10
//        modal: true
//       focus: true
//		anchors.centerIn: parent
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
		
		Rectangle
		{
			anchors.fill: parent
			color: "red"
		}
    }
}