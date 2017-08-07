(function () { "use strict";
var js = {};
var jp = {};
jp.saken = {};
jp.saken.utils = {};
jp.saken.utils.Dom = function() { };
var src = {};
src.Main = function() { };
src.Main.main = function() {
	jp.saken.utils.Dom.window.onload = src.Main.init;
};
src.Main.init = function(event) {
	src.Main._canvas = window.document.getElementById("canvas");
	src.Main._stage = new createjs.Stage(src.Main._canvas);
	src.Main.addShape();
	src.Main.loadImage();
	src.Main.play();
};
src.Main.addShape = function() {
	var colornumber = Math.floor(16777215 * Math.random());
	var color = "#" + colornumber.toString(16);
	var circle = src.Main.getCircle(color,Math.floor(30 * Math.random()));
	var rect = src.Main.getRect(color);
	circle.x = Math.floor(1000 * Math.random());
	circle.y = Math.floor(600 * Math.random());
	rect.x = 300;
	rect.y = 400;
	src.Main._stage.addChild(circle);
	src.Main._stage.addChild(rect);
	createjs.Tween.get(circle).wait(200).to({ alpha : .5, scaleX : .6, scaleY : .6},300,createjs.Ease.backInOut).call(src.Main.addShape);
	createjs.Tween.get(rect).to({ scaleX : 2, scaleY : 2, rotation : 90},1000,createjs.Ease.backInOut);
};
src.Main.getCircle = function(color,size) {
	if(size == null) size = 100;
	var shape = new createjs.Shape();
	shape.graphics.beginFill(color);
	shape.graphics.drawCircle(size * .5,size * .5,size);
	return shape;
};
src.Main.getRect = function(color,w,h) {
	if(h == null) h = 100;
	if(w == null) w = 100;
	var shape = new createjs.Shape();
	shape.graphics.beginFill(color);
	shape.graphics.drawRect(-w * .5,-h * .5,w,h);
	return shape;
};
src.Main.loadImage = function() {
	var loader = new createjs.LoadQueue(false);
	loader.addEventListener("fileload",src.Main.onLoaded);
	loader.loadFile({ id : "image", src : "files/img/001.jpg"});
};
src.Main.onLoaded = function(event) {
	var loader = event.target;
	var image = loader.getResult("image");
	var bitmap = new createjs.Bitmap(image);
	loader.removeEventListener("fileload",src.Main.onLoaded);
	src.Main._stage.addChildAt(bitmap,0);
};
src.Main.play = function() {
	createjs.Ticker.setFPS(30);
	createjs.Ticker.timingMode = createjs.Ticker.RAF_SYNCHED;
	createjs.Ticker.addEventListener("tick",src.Main.onTick);
};
src.Main.onTick = function(event) {
	src.Main._canvas.width = jp.saken.utils.Dom.window.innerWidth;
	src.Main._canvas.height = jp.saken.utils.Dom.window.innerHeight;
	src.Main._stage.update();
};
src.Main.tween = function() {
	TweenMax.to("#canvas",1,{ css : { left : 800, top : 40}, ease : Back.easeOut});
};
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
var q = window.jQuery;
js.JQuery = q;
jp.saken.utils.Dom.document = window.document;
jp.saken.utils.Dom.window = window;
jp.saken.utils.Dom.jWindow = new js.JQuery(jp.saken.utils.Dom.window);
jp.saken.utils.Dom.body = jp.saken.utils.Dom.document.body;
jp.saken.utils.Dom.jBody = new js.JQuery(jp.saken.utils.Dom.body);
jp.saken.utils.Dom.userAgent = jp.saken.utils.Dom.window.navigator.userAgent;
src.Main.main();
})();
