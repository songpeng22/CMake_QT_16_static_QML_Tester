import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle {
    id: rect
    width: 100; height: 100
    color: "red"

    ParallelAnimation {
        running: true
        NumberAnimation { target: rect; property: "x"; to: 50; duration: 1000 }
        NumberAnimation { target: rect; property: "y"; to: 50; duration: 1000 }
    }
}