package;

import js.JQuery;
 
class Main {
	
	static function main():Void {

		var test:JQuery = new JQuery('#all');
		trace(test.html());

    }

}