import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Material 2.0


StackView {
	id: stackView
//	initialItem: mainView
	anchors.fill: parent
			
	pushEnter: Transition {
		id: pushEnter
		ParallelAnimation {
			PropertyAction { property: "x"; value: 0 }
			NumberAnimation { properties: "y"; from: 0; to: 0; duration: 400; easing.type: Easing.OutCubic }
			NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.OutCubic }
		}
	}
	popExit: Transition {
		id: popExit
		ParallelAnimation {
			PropertyAction { property: "x"; value: 0 }
			NumberAnimation { properties: "y"; from: 0; to: 0; duration: 400; easing.type: Easing.OutCubic }
			NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 400; easing.type: Easing.OutCubic }
		}
	}

	pushExit: Transition {
		id: pushExit
		PropertyAction { property: "x"; value: 0 }
		PropertyAction { property: "y"; value: 0 }
	}
	popEnter: Transition {
		id: popEnter
		PropertyAction { property: "x"; value: 0 }
		PropertyAction { property: "y"; value: 0 }
	}

}