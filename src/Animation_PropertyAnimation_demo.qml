import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Dialogs 1.1

/*
//changing x from 0 to 50
Rectangle {
    width: 100; height: 100
    color: "red"

    Behavior on x { PropertyAnimation {} }

    MouseArea { anchors.fill: parent; onClicked: parent.x = 50 }
}
*/

//repeat changing the property
Rectangle {
    width: 200; height: 100
    color: "red"

    SequentialAnimation on x {
        loops: Animation.Infinite
        PropertyAnimation { to: 100; duration: 1000 }
        PropertyAnimation { to: 0 }
    }
}