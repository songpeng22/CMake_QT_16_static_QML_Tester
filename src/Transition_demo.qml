import QtQuick 2.0

Rectangle {
    id: rect
    width: 100; height: 100
    color: "red"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed:{
//            rect.state = "moved";
        }
        onClicked:{
            console.log("rect.state:",rect.state);
        }
    }

    states: State {
        name: "moved"; when: mouseArea.pressed
        PropertyChanges { target: rect; color:"blue"; x: 50; y: 50 }
    }

    transitions: Transition {
        from: "*"; to: "moved";
        ParallelAnimation{
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad ;duration: 500; }
            ColorAnimation { properties:"color"; duration: 500 }
        }
    }

    Component.onCompleted:{
        console.log("state:",state);
    }
}
