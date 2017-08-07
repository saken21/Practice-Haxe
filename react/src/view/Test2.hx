package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Test2 extends ReactComponent {
	
	public function new():Void {
		
		super();
		this.state = { text:'Test2' };
		
	}
	
	public override function render():ReactComponent {
		
		return jsx('<h1 className="test2" onClick=$onClick>${this.state.text}</h1>');
		
	}
	
	private function onClick():Void {
		
		setState({ text:'Clicked' });
		
	}
	
}