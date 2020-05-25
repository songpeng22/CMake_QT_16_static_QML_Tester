import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Item
{
	id: idItemKeyBoard
	width: 600
	height: 400	
	
	GridLayout {
		id: grid
		anchors.fill: parent
		rows:5
		columns: 5
		rowSpacing: 2
		columnSpacing: 0
		property double colMulti : grid.width / grid.columns
		property double rowMulti : grid.height / grid.rows
		function prefWidth(item){
			return colMulti * item.Layout.columnSpan
		}
		function prefHeight(item){
			return rowMulti * item.Layout.rowSpan
		}
/*
		Repeater
		{
			id: idRepeater
			model: 25
			Rectangle { 
				Layout.fillHeight: true
				Layout.fillWidth: true
				color: "white" 
			}
		}
*/		
		Rectangle { 
			Layout.row: 0
			Layout.column: 0
			Layout.rowSpan: 1
			Layout.columnSpan: 2
			Layout.preferredWidth  : grid.prefWidth(this)
			Layout.preferredHeight : grid.prefHeight(this)
			
			color: "silver" 
		}
		
		Rectangle { 
			Layout.row: 1
			Layout.column: 0
			Layout.rowSpan: 2
			Layout.columnSpan: 5
			Layout.preferredWidth  : grid.prefWidth(this)
			Layout.preferredHeight : grid.prefHeight(this)
			color: "grey" 
		}
		Rectangle { 
			Layout.row: 3
			Layout.column: 0
			Layout.rowSpan: 2
			Layout.columnSpan: 5
			Layout.preferredWidth  : grid.prefWidth(this)
			Layout.preferredHeight : grid.prefHeight(this)
			color: "grey" 
		}
		
	}
}