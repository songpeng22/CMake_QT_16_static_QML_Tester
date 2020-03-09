import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true
	
	property real offset: 10

    StackView_Standard {
        id: stackView
        initialItem: mainView
//        anchors.fill: parent
	
    }

    Component {
        id: mainView

        Row {
			property var index: StackView.index
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
			Button {
				text: "hide"
				onClicked: {
					stackView.get(2,StackView.ForceLoad).visible = false;
					stackView.get(1,StackView.ForceLoad).visible = false;
					stackView.get(0,StackView.ForceLoad).visible = true;
					console.log(stackView.get(2,StackView.ForceLoad).x);
					console.log(stackView.get(1,StackView.ForceLoad).x);
					console.log(stackView.get(0,StackView.ForceLoad).x);
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
			Button {
				text: "show status"
				onClicked: {
					console.log("pos:",pos);
					console.log("StackView.index:",index);

				}
			}
            Text {
                text: stackView.depth
            }
			Text {
                text: index
            }
			StackView.visible: true
			
			StackView.onActivating: {
				console.log("StackView.onActivating");
				console.log("index:",index);
				console.log("StackView.index:",StackView.index);
				if( StackView.index > 0 )
				{
					stackView.get(StackView.index - 1,StackView.ForceLoad).visible = false;
				}
			}
			
			StackView.onDeactivating:
			{
				console.log("StackView.onDeactivating");
				console.log("StackView.index:",StackView.index);
			}
			
			StackView.onActivated:
			{
				console.log("StackView.onActivated");
				console.log("StackView.index:",StackView.index);
			}
			
			StackView.onDeactivated:
			{
				console.log("StackView.onDeactivated");
				console.log("StackView.index:",StackView.index);
			}
			
			StackView.onRemoved:
			{
				console.log("StackView.onRemoved");
				console.log("index:",index);
				console.log("StackView.index:",StackView.index);
				stackView.get(stackView.depth-1,StackView.ForceLoad).visible = true;
			}
        }
		
    }
}