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
		property real offset: 10
		width: 100; height: 100

		initialItem: Component {
			id: page
			Rectangle {
				property real pos: StackView.index * stackView.offset
				property real hue: Math.random()
				color: Qt.hsla(hue, 0.5, 0.8, 0.6)
				border.color: Qt.hsla(hue, 0.5, 0.5, 0.9)
				StackView.visible: true
			}
		}

		pushEnter: Transition {
			id: pushEnter
			ParallelAnimation {
				PropertyAction { property: "x"; value: pushEnter.ViewTransition.item.pos }
				NumberAnimation { properties: "y"; from: pushEnter.ViewTransition.item.pos + stackView.offset; to: pushEnter.ViewTransition.item.pos; duration: 400; easing.type: Easing.OutCubic }
				NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.OutCubic }
			}
		}
		popExit: Transition {
			id: popExit
			ParallelAnimation {
				PropertyAction { property: "x"; value: popExit.ViewTransition.item.pos }
				NumberAnimation { properties: "y"; from: popExit.ViewTransition.item.pos; to: popExit.ViewTransition.item.pos + stackView.offset; duration: 400; easing.type: Easing.OutCubic }
				NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 400; easing.type: Easing.OutCubic }
			}
		}

		pushExit: Transition {
			id: pushExit
			PropertyAction { property: "x"; value: pushExit.ViewTransition.item.pos }
			PropertyAction { property: "y"; value: pushExit.ViewTransition.item.pos }
		}
		popEnter: Transition {
			id: popEnter
			PropertyAction { property: "x"; value: popEnter.ViewTransition.item.pos }
			PropertyAction { property: "y"; value: popEnter.ViewTransition.item.pos }
		}
	}


	Row {
		y: 200
		spacing: 10

		Button {
			text: "Push"
			onClicked: stackView.push(page)
		}
		Button {
			text: "Pop"
			enabled: stackView.depth > 1
			onClicked: stackView.pop()

		}
		Button {
			text: "hide"
			onClicked: {
				stackView.get(2,StackView.ForceLoad).visible = false;
				stackView.get(1,StackView.ForceLoad).visible = false;
				stackView.get(0,StackView.ForceLoad).visible = true;
			}
		}
		Button {
			text: "show"
			onClicked: {
				stackView.get(2,StackView.ForceLoad).visible = true;
				stackView.get(1,StackView.ForceLoad).visible = true;
				stackView.get(0,StackView.ForceLoad).visible = true;
			}
		}
		Text {
			text: stackView.depth
		}
	}

}