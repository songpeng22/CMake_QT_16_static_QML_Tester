import QtQuick 2.0

Rectangle {
    width: 100; height: 100
    color: "red"

    NumberAnimation on x { to: 50; duration: 1000 /*1000 milisecond*/ }
}
