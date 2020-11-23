import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Component.onCompleted: {
        var JsonString = '{"a":"A whatever, run","b":"B fore something happens"}';
        var JsonObject= JSON.parse(JsonString);

        //retrieve values from JSON again
        var aString = JsonObject.a;
        var bString = JsonObject.b;

        console.log(aString);
        console.log(bString);
    }
}