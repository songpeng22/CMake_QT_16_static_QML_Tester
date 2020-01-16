import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Rectangle
{
	id: idItemKeyBoard
	width: 600
	height: 400
	color: "white"
	
	property var index: 0
	
	Flickable 
	{
		id: flick

		width: 300; height: 100;
		contentWidth: edit.paintedWidth
		contentHeight: edit.paintedHeight
		clip: true

		function ensureVisible(r)
		{
			if (contentX >= r.x)
				contentX = r.x;
			else if (contentX+width <= r.x+r.width)
				contentX = r.x+r.width-width;
			if (contentY >= r.y)
				contentY = r.y;
			else if (contentY+height <= r.y+r.height)
				contentY = r.y+r.height-height;
		}

		TextEdit 
		{
			id: edit
			width: flick.width
			focus: true
			text: "hello world \n1...\n2...\n3...\n4...\n5...\n6...\n7...\n8...\n9..."
			wrapMode: TextEdit.Wrap
			
			onCursorRectangleChanged: {
				flick.ensureVisible(cursorRectangle);
				
				console.log("onCursorRectangleChanged");
			}
			
			onEditingFinished:
			{
				console.log("TextEdit::onEditingFinished:");
			}
			
			Component.onCompleted:{
				cursorPosition = text.length;
			}
		}
	}
	
	Button{
		y: flick.y + flick.height
		text: "insert"
		onClicked:
		{
			var str = "";
			index = index + 1;
			str = str + "\n" + index;
			edit.insert(edit.text.length,str);
			edit.cursorPosition = edit.text.length;
			
		}
	}
}