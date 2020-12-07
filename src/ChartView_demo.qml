import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtCharts 2.2

Rectangle
{
	width: 1600
	height: 900
	
	GridLayout
	{
		width: parent.width
		height: parent.height

		columns: 4
		rows: 3
		
		ChartView {
//			width: 400
//			height: 300
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300			
			theme: ChartView.ChartThemeBrownSand
			antialiasing: true

			PieSeries {
				id: pieSeries
				PieSlice { label: "eaten"; value: 94.9 }
				PieSlice { label: "not yet eaten"; value: 5.1 }
			}
		}
		
		ChartView {
			title: "Line"
//			anchors.fill: parent
//			width: 400
//			height: 300
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300
			antialiasing: true

			LineSeries {
				name: "LineSeries"
				XYPoint { x: 0; y: 0 }
				XYPoint { x: 1.1; y: 2.1 }
				XYPoint { x: 1.9; y: 3.3 }
				XYPoint { x: 2.1; y: 2.1 }
				XYPoint { x: 2.9; y: 4.9 }
				XYPoint { x: 3.4; y: 3.0 }
				XYPoint { x: 4.1; y: 3.3 }
			}
		}
		
		ChartView {
			title: "Spline"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300			
			antialiasing: true
			

			SplineSeries {
				name: "SplineSeries"
				XYPoint { x: 0; y: 0.0 }
				XYPoint { x: 1.1; y: 3.2 }
				XYPoint { x: 1.9; y: 2.4 }
				XYPoint { x: 2.1; y: 2.1 }
				XYPoint { x: 2.9; y: 2.6 }
				XYPoint { x: 3.4; y: 2.3 }
				XYPoint { x: 4.1; y: 3.1 }
			}
		}

		ChartView {
			title: "NHL All-Star Team Players"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300				
			antialiasing: true

			// Define x-axis to be used with the series instead of default one
			ValueAxis {
				id: valueAxis
				min: 2000
				max: 2011
				tickCount: 12
				labelFormat: "%.0f"
			}

			AreaSeries {
				name: "Russian"
				axisX: valueAxis
				upperSeries: LineSeries {
					XYPoint { x: 2000; y: 1 }
					XYPoint { x: 2001; y: 1 }
					XYPoint { x: 2002; y: 1 }
					XYPoint { x: 2003; y: 1 }
					XYPoint { x: 2004; y: 1 }
					XYPoint { x: 2005; y: 0 }
					XYPoint { x: 2006; y: 1 }
					XYPoint { x: 2007; y: 1 }
					XYPoint { x: 2008; y: 4 }
					XYPoint { x: 2009; y: 3 }
					XYPoint { x: 2010; y: 2 }
					XYPoint { x: 2011; y: 1 }
				}
			}	
		}

		ChartView {
			title: "Scatters"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300					
			antialiasing: true
			
//			ValueAxis {
//				id: xAxis
//				min: 1
//				max: 4
//			}
//					

			ScatterSeries {
				id: scatter1
				name: "Scatter1"
				
				axisX: ValueAxis { min: 1; max: 3 }
				axisY: ValueAxis { min: 1; max: 3 }

				XYPoint { x: 1.5; y: 1.5 }
				XYPoint { x: 1.5; y: 1.6 }
				XYPoint { x: 1.57; y: 1.55 }
				XYPoint { x: 1.8; y: 1.8 }
				XYPoint { x: 1.9; y: 1.6 }
				XYPoint { x: 2.1; y: 1.3 }
				XYPoint { x: 2.5; y: 2.1 }
			}	
			
			ScatterSeries {
				id: scatter2
				name: "Scatter2"
				
//				axisX: ValueAxis { min: 0; max: 10 }				
				
				XYPoint { x: 1.5; y: 1.8 }
				XYPoint { x: 1.5; y: 2.6 }
				XYPoint { x: 1.57; y: 2.55 }
				XYPoint { x: 1.8; y: 2.8 }
				XYPoint { x: 1.9; y: 2.6 }
				XYPoint { x: 2.1; y: 2.3 }
				XYPoint { x: 2.5; y: 1.1 }
			}				
		}

		ChartView {
			title: "Bar series"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300				
			legend.alignment: Qt.AlignBottom
			antialiasing: true

			BarSeries {
				id: mySeries
				axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
				BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
				BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
				BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
			}
		}

		ChartView {
			title: "Stacked Bar series"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300				
			legend.alignment: Qt.AlignBottom
			antialiasing: true

			StackedBarSeries {
				id: stackedSeries
				axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
				BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
				BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
				BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
			}
		}	

		ChartView {
			title: "Percent Bar series"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300	
			legend.alignment: Qt.AlignBottom
			antialiasing: true

			PercentBarSeries {
				axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
				BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
				BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
				BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
			}
		}	

		ChartView {
			title: "Horizontal Bar series"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300	
			legend.alignment: Qt.AlignBottom
			antialiasing: true

			HorizontalBarSeries {
				axisY: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
				BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
				BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
				BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
			}
		}	

		ChartView {
			title: "Horizontal Stacked Bar series"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300	
			legend.alignment: Qt.AlignBottom
			antialiasing: true

			HorizontalStackedBarSeries {
				axisY: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
				BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
				BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
				BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
			}
		}	

		ChartView {
			title: "Horizontal Percent Bar series"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300	
			legend.alignment: Qt.AlignBottom
			antialiasing: true

			HorizontalPercentBarSeries {
				axisY: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
				BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
				BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
				BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
			}
		}	

		ChartView {
			id: chart
			title: "Production costs"
//			anchors.fill: parent
			Layout.preferredWidth: 400
			Layout.preferredHeight: 300	
			legend.visible: false
			antialiasing: true

			PieSeries {
				id: pieOuter
				size: 0.96
				holeSize: 0.7
				PieSlice { id: slice; label: "Alpha"; value: 19511; color: "#99CA53" }
				PieSlice { label: "Epsilon"; value: 11105; color: "#209FDF" }
				PieSlice { label: "Psi"; value: 9352; color: "#F6A625" }
			}

			PieSeries {
				size: 0.7
				id: pieInner
				holeSize: 0.25

				PieSlice { label: "Materials"; value: 10334; color: "#B9DB8A" }
				PieSlice { label: "Employee"; value: 3066; color: "#DCEDC4" }
				PieSlice { label: "Logistics"; value: 6111; color: "#F3F9EB" }

				PieSlice { label: "Materials"; value: 7371; color: "#63BCE9" }
				PieSlice { label: "Employee"; value: 2443; color: "#A6D9F2" }
				PieSlice { label: "Logistics"; value: 1291; color: "#E9F5FC" }

				PieSlice { label: "Materials"; value: 4022; color: "#F9C36C" }
				PieSlice { label: "Employee"; value: 3998; color: "#FCE1B6" }
				PieSlice { label: "Logistics"; value: 1332; color: "#FEF5E7" }
			}
		}

		Component.onCompleted: {
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
		}		
	}
	
}


