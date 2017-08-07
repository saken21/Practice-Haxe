package;

import js.Browser;
import js.html.Event;
import vue.Vue;

class Main {
	
	public static function main():Void {
		
		Browser.window.addEventListener('load',onLoaded);
		
	}

	private static function onLoaded(event:Event):Void {

		var data:Dynamic = {

			name    : 'Kenta Sakata',
			friends : [{ name:'Iwao', age:'36' }]

		};

		var vue:Vue<Dynamic> = new Vue({ el:'#app', data:data });

	}

}