import QtQuick 2.0

Rectangle {
    width: 300; height: 300

    Text {
        id: myText
        text: 'Click anywhere'
    }

    WorkerScript {
        id: myWorker
        source: "WorkerScript_demo.js"

        onMessage: myText.text = messageObject.reply
    }

    MouseArea {
        anchors.fill: parent
        onClicked: myWorker.sendMessage({ 'x': mouse.x, 'y': mouse.y })
    }
}