package;

import js.Browser;
import api.react.ReactDOM;
import api.react.ReactMacro.jsx;
import view.*;

class Main {
	
	public static function main():Void {
		
		ReactDOM.render(jsx('<$Test/>'),Browser.document.getElementById('app'));
		
	}
	
}