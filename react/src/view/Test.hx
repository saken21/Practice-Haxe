package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Test extends ReactComponent {
	
	public function new():Void {
		
		super();
		state = { cls:'test', text:'Test' };
		
	}
	
	public override function render():ReactComponent {
		
		return jsx('<h1 className="${state.cls}" onClick=$onClick>${state.text}</h1>');
		
	}
	
	private function onClick():Void {
		
		setState({ cls:'clicked', text:'Clicked' });
		
	}
	
}