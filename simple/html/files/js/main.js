(function () { "use strict";
var Main = function() { };
Main.main = function() {
	var test = new js.JQuery("#all");
	console.log(test.html());
};
var js = {};
var q = window.jQuery;
js.JQuery = q;
Main.main();
})();
