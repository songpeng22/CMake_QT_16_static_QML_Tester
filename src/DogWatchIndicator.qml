import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

BusyIndicator
{
    id: busyIndicator
    running: false

    property bool eat: false
    property int hungary: 0
    readonly property int biteTiming: 4

    Timer
    {
        id: timer
        interval: 500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered:
        {
            if(eat)
            {
                eat = false
                hungary = 0;

                busyIndicator.running = true;
				
				console.log("dog feed.");
            }
            else
            {
                hungary += 1;
				
				
				if( hungary >= biteTiming )
				{
					//bite
					busyIndicator.running = false;
					
					console.log("dog bite:",hungary);
				}
				else
				{
					console.log("dog hungary:",hungary);
				}
            }
        }
    }
}
