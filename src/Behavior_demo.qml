import QtQuick 2.0

Rectangle {
    id: rect
    width: 100; height: 100
    color: "red"

    Behavior on width {
        NumberAnimation { duration: 1000 }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: rect.width = 50
    }
}
