import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtCharts 2.2

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 500
	color: "teal"
	
	ChartView {
		title: "Horizontal Bar series"
//			anchors.fill: parent
//		Layout.preferredWidth: 400
//		Layout.preferredHeight: 300	
		width: 600
		height: 400		
		legend.alignment: Qt.AlignBottom
		antialiasing: true

		HorizontalBarSeries {
			id: barSeries
			axisX: ValueAxis{ min:0; max: 100; }
			axisY: BarCategoryAxis { categories: ["CPU Board Temp.1", "CPU Board Temp.2", "CPU Board Temp.3", "CPU", "GPU", ] }
			BarSet { label: "Bob"; values: [12, 22, 33, 44, 55] }
			
			onBarsetsAdded:
			{
				
			}
		}
	}
	
	Button
	{
		text:"test"
		width: 100
		height: 40
		x: 0
		y: 400
		onClicked:{
		    barSeries.clear();
//			barSeries.append("abc",[22, 12, 43, 4, 55])
			barSeries.append("abc",[getRandomInt(100), getRandomInt(100), getRandomInt(100), getRandomInt(100), getRandomInt(100)])

		}
	}

	Timer
	{
	    running: true
		interval: 1000
		repeat: true
		onTriggered:
		{
		    barSeries.clear();
			barSeries.append("abc",[getRandomInt(100), getRandomInt(100), getRandomInt(100), getRandomInt(100), getRandomInt(100)])	
		}
	}
	
	function getRandomInt(max) {
		return Math.floor(Math.random() * Math.floor(max));
	}
	
	Component.onCompleted: {
	    console.log("barSeries.count:",barSeries.count);
		
		
		
/*		
		// Set the common slice properties dynamically for convenience
		for (var i = 0; i < pieOuter.count; i++) {
			pieOuter.at(i).labelPosition = PieSlice.LabelOutside;
			pieOuter.at(i).labelVisible = true;
			pieOuter.at(i).borderWidth = 3;
		}
		for (var i = 0; i < pieInner.count; i++) {
			pieInner.at(i).labelPosition = PieSlice.LabelInsideNormal;
			pieInner.at(i).labelVisible = true;
			pieInner.at(i).borderWidth = 2;
		}
*/		
	}		
	
}