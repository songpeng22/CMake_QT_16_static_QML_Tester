//utils.js

var component;
var object;

//MyScript.createComponentObject(idItemADCParameters,"KeyboardGFactor.qml");
//idItemADCParameters : parent id
//"KeyboardGFactor.qml" : qml to create
function createComponentObject(item, stylePath)
{
    component = Qt.createComponent(stylePath);
    if( Component.Ready == component.status ){
        object = component.createObject(item);
        console.log("[!!!OK!!!]component Creation:" + stylePath + " component ready");
    }
    else if (Component.Error == component.status)
    {
        console.log("[!!!ERR!!!]component Creation:" + stylePath + " component error " + component.errorString());
    }
    else
        console.log("component Creation:" + stylePath + " component not ready");

    if (object === null)
        console.log("component Creation: error creating " + stylePath + " object");
    else
        return object;
}

function createComponentObjectWithParameter(item, stylePath,parameter1) {
    component = Qt.createComponent(stylePath);
    if (Component.Ready == component.status) {
        object = component.createObject(item, parameter1);
        console.log("[!!!OK!!!]component Creation:" + stylePath + " component ready");
    }
    else if (Component.Error == component.status) {
        console.log("[!!!ERR!!!]component Creation:" + stylePath + " component error " + component.errorString());
    }
    else
        console.log("component Creation:" + stylePath + " component not ready");

    if (object === null)
        console.log("component Creation: error creating " + stylePath + " object");
    else
        return object;
}


