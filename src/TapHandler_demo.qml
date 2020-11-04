import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import Qt.labs.handlers 1.0

Rectangle {
   width: 600
   height: 400
   color: "lime"
   
   TapHandler {
       onTapped: console.log("left clicked")
   }
   TapHandler {
       acceptedButtons: Qt.RightButton
       onTapped: console.log("right clicked")
   }
}