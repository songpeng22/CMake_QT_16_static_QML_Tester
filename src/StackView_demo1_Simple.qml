import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Material 2.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    StackView {
        id: stackView
        initialItem: mainView
        anchors.fill: parent
    }

    Component {
        id: mainView

        Row {
            spacing: 10

            Button {
                text: "Push"
                onClicked: stackView.push(mainView)
            }
            Button {
                text: "Pop"
                enabled: stackView.depth > 1
                onClicked: stackView.pop()

            }
            Text {
                text: stackView.depth
            }
			StackView.visible: true
        }
    }
}