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
        onClicked: myRect.state == 'clicked' ? myRect.state = "" : myRect.state = 'clicked';
    }

    states: [
        State {
            name: "clicked"
            PropertyChanges { target: myRect; color: "red" }
        }
    ]
}