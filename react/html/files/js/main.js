(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Main = function() { };
Main.main = function() {
	ReactDOM.render(React.createElement(view.Test,null),window.document.getElementById("app"));
};
var api = {};
api.react = {};
api.react.ReactMacro = function() { };
var view = {};
view.Test = function() {
	React.Component.call(this);
	this.state = { cls : "test", text : "Test"};
};
view.Test.__super__ = React.Component;
view.Test.prototype = $extend(React.Component.prototype,{
	render: function() {
		return React.createElement("h1",{ className : this.state.cls, onClick : $bind(this,this.onClick)},this.state.text);
	}
	,onClick: function() {
		this.setState({ cls : "clicked", text : "Clicked"});
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
view.Test.displayName = "Test";
Main.main();
})();
