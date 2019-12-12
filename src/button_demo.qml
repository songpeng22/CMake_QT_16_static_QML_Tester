import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4

Window {
    id:root
	objectName: "objItem"
    visible: true
    width: 800
    height: 600

	//Rectangle for TabBar
    Rectangle{
        id:idRect1
        objectName : "objRect1"
        color: "teal"
        height:parent.height * 1 / 2
        width : parent.width
 
		//Button with Style
		Button {
			id: idButton1
			objectName: "objButton1"
			anchors.left : parent.left
			anchors.right : parent.right
			height: parent.height
			text: "Exit"

			contentItem: Text {
				text: idButton1.text
				font: idButton1.font
				opacity: enabled ? 1.0 : 0.3
				color: idButton1.down ? "black" : "green"
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				elide: Text.ElideRight
			}

			background: Rectangle {
				implicitWidth: 100
				implicitHeight: 40
				opacity: enabled ? 1 : 0.3
				color:idButton1.down ? "white" : "orange"
				border.color: idButton1.down ? "red" : "black"
				border.width: 1
				radius: 2
			}

			onClicked:{
				console.log("idButton1 onClicked..")
				Global.textChanged();
			}
		}
     
    }
	
	Rectangle{
        id:idRect2
        objectName : "objRect2"
        color: "teal"
        height: parent.height / 2
        width : parent.width
		anchors.top:idRect1.bottom

		Text{
			id: text1
			text:Global.textOfButton
		}
		Text{
			id: text2
			anchors.top:text1.bottom
			text:Global.text2()
		}

    }

	Connections{
		target:Global
		onTextChanged: {
			console.log("onTextChanged..")
			text2.text = Global.textOfButton
		}
	}

	Component.onCompleted:{
//		console.log("value" , Global.value());
	}
}
