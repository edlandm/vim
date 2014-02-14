// Slate Config file

var pushRight = slate.operation("push", {
    "direction": "right",
    "style": "bar-resize:screenSizeX/3"
});
var pushLeft = slate.operation("push", {
    "direction": "left",
    "style": "bar-resize:screenSizeX/3"
});
var pushTop = slate.operation("push", {
    "direction": "top",
    "style": "bar-resize:screenSizeY/2"
});
var pushBottom = slate.operation("push", {
    "direction": "bottom",
    "style": "bar-resize:screenSizeY/2"
});
var fullsreen = slate.operation("move", {
    "x": "screenOriginX",
    "y": "screenOriginY",
    "width": "screenSizeX",
    "height": "screenSizeY"
});

//slate.config(name, value)
//slate.configAll({name: value,
//                 name2: value2})
slate.configAll({
    "defaultToCurrentScreen": true,
    "nudgePercentOf": "screenSize",
    "resizePercentOf": "screenSize"
})
