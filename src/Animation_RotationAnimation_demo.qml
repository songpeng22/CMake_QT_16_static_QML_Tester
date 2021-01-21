import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle {
    id: rotatingBox
    width: 50
    height: 50
    color: "lightsteelblue"
    RotationAnimator {
        target: rotatingBox;
        from: 0;
        to: 360;
        duration: 1000
        running: true
    }
}