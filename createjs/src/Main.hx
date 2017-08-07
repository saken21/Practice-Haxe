package src;

import js.Browser;
import js.html.Element;
import js.html.CanvasElement;
import js.JQuery;
import jp.saken.utils.Dom;
import createjs.easeljs.Stage;
import createjs.easeljs.Bitmap;
import createjs.easeljs.Shape;
import createjs.easeljs.Ticker;
import createjs.easeljs.Event;
import createjs.tweenjs.Tween;
import createjs.tweenjs.Ease;
import createjs.preloadjs.LoadQueue;
import tween.TweenMaxHaxe;
import tween.easing.Power2;
import tween.easing.Back;
 
class Main {
	
	private static var _canvas:CanvasElement;
	private static var _stage :Stage;
	
	public static function main():Void {
		
		Dom.window.onload = init;
		
	}
	
	private static function init(event:Dynamic):Void {
		
		_canvas = cast Browser.document.getElementById('canvas');
		_stage  = new Stage(_canvas);
		
		addShape();
		loadImage();
		
		play();
		//tween();
		
	}
	
	private static function addShape():Void {
		
		var colornumber:Int = Math.floor(0xffffff * Math.random());
		var color:String = '#' + untyped colornumber.toString(16);
		
		var circle:Shape = getCircle(color,Math.floor(30 * Math.random()));
		var rect  :Shape = getRect(color);
		
		circle.x = Math.floor(1000 * Math.random());
		circle.y = Math.floor(600 * Math.random());
		
		rect.x = 300;
		rect.y = 400;
		
		_stage.addChild(circle);
		_stage.addChild(rect);
		
		Tween.get(circle).wait(200).to({ alpha:.5, scaleX:.6, scaleY:.6 },300,Ease.backInOut).call(addShape);
		Tween.get(rect).to({ scaleX:2, scaleY:2, rotation:90 },1000,Ease.backInOut);
		
	}
	
	private static function getCircle(color:String,size:Int = 100):Shape {
		
		var shape:Shape = new Shape();
		
		shape.graphics.beginFill(color);
		shape.graphics.drawCircle(size * .5,size * .5,size);
		
		return shape;
		
	}
	
	private static function getRect(color:String,w:Int = 100,h:Int = 100):Shape {
		
		var shape:Shape = new Shape();
		
		shape.graphics.beginFill(color);
		shape.graphics.drawRect(-w * .5,-h * .5,w,h);
		
		return shape;
		
	}
	
	private static function loadImage():Void {
		
		var loader:LoadQueue = new LoadQueue(false);
		
		loader.addEventListener('fileload',onLoaded);
		loader.loadFile({ id:'image', src:'files/img/001.jpg' });
		
	}
	
	private static function onLoaded(event:Event):Void {
		
		var loader:LoadQueue = event.target;
		var image :Dynamic   = loader.getResult('image');
		var bitmap:Bitmap    = new Bitmap(image);
		
		loader.removeEventListener('fileload',onLoaded);
		
		_stage.addChildAt(bitmap,0);
		
	}
	
	private static function play():Void {
		
		Ticker.setFPS(30);
		Ticker.timingMode = Ticker.RAF_SYNCHED;
		
		Ticker.addEventListener('tick',onTick);
		
	}
	
	private static function onTick(event:Event):Void {
		
		_canvas.width  = Dom.window.innerWidth;
		_canvas.height = Dom.window.innerHeight;
		
		_stage.update();
		
	}
	
	private static function tween():Void {
		
		TweenMaxHaxe.to('#canvas',1,{ css:{ left:800, top:40 }, ease:Back.easeOut });
		
	}

}