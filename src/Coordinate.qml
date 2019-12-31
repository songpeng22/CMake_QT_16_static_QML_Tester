import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    x: 100
    y: 100
    width: 640
    height: 480
    title: qsTr("Test item maps")

    Rectangle {
        id: container

        anchors.fill: parent
        anchors.margins: 20

        border.color: "gray"

        Rectangle {
            id: content
            implicitWidth: 120
            implicitHeight: 120
            color: "#666"
			x: 0//-20
			y: 0//-20

            Text {
                id: posValue
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                drag.target: content
                drag.minimumX: 0
                drag.maximumX: container.width - content.width
                drag.minimumY: 0
                drag.maximumY: container.height - content.height

                function updateText(){
                    var t,m

                    m = container.mapFromItem(content, 0, 0, 12, 34);

                    t = m.x + "," + m.y + "," + m.width + "," + m.height + "\n"
/**/
					//root 坐标系
					//具体:map (x,y) from root Coordinate to current Coordinate
                    m = container.mapFromItem(null, 0, 0, 12, 34);

                    t += m.x + "," + m.y + "," + m.width + "," + m.height + "\n"

                    m = content.mapToItem(container, 0, 0, 12, 34);

                    t += m.x + "," + m.y + "," + m.width + "," + m.height + "\n"

					//root 坐标系
					//具体：map(x,y) in current Coordinate to root Coordinate
                    m = content.mapToItem(null, 0, 0, 12, 34);

                    t += m.x + "," + m.y + "," + m.width + "," + m.height

                    posValue.text = t

                }

                onPositionChanged: {
                    updateText()
                }

                Component.onCompleted: updateText()
            }
        }
    }
}
