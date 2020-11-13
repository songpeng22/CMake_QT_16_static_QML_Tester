import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

Rectangle {
    id: myRect
    width: 100; height: 100
    color: "lime"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: 
		{
			if( myRect.state === 'state1' )
			{
				myRect.state = 'state2';
			}
			else if( myRect.state === 'state2' )
			{
				myRect.state = 'state3';
			}
			else if( myRect.state === 'state3' )
			{
				myRect.state = 'state1';
			}			
			else
			{
			
			}
		}
    }

    states: [
        State {
            name: "state1"
            PropertyChanges { target: myRect; color: "red" }
        },
        State {
            name: "state2"
            PropertyChanges { target: myRect; color: "green" }
        },
        State {
            name: "state3"
            PropertyChanges { target: myRect; color: "violet" }
        }			
    ]
	
	Component.onCompleted:
	{
		myRect.state = 'state1';
	}
}