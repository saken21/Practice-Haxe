package;

import js.Browser.document;
import js.Browser.window;
import js.html.MouseEvent;
import three.Three;
 
class Main {

	private static var _meshes  :Array<Mesh>;
	private static var _scene   :Scene;
	private static var _camera  :Camera;
	private static var _renderer:Renderer;
	private static var _mouseX  :Int;
	private static var _mouseY  :Int;
	
	/* =======================================================================
	Constructor
	========================================================================== */
	private static function main():Void {

		window.onload = init;

    }

    /* =======================================================================
	Init
	========================================================================== */
    private static function init():Void {

    	var w:Int = window.innerWidth;
    	var h:Int = window.innerHeight;

    	_meshes   = [];
    	_scene    = new Scene();
		_camera   = new PerspectiveCamera(50,w / h,.01,100);
		_renderer = new WebGLRenderer({ antialias:true, canvas:cast document.getElementById('canvas') });

		_renderer.setSize(w,h);
		_scene.add(_camera);

		for (i in 0...1000) {
			addScene();
		}

		_renderer.domElement.onmousemove = onMousemove;
		window.requestAnimationFrame(update);

    }

    /* =======================================================================
	Add Scene
	========================================================================== */
    private static function addScene():Void {

    	var color   :Int      = Math.floor(0xffffff * Math.random());
    	var geometry:Geometry = new BoxGeometry(.05,.05,.05);
    	var material:Material = new MeshBasicMaterial({ color:new Color(color) });
    	var mesh    :Mesh     = new Mesh(geometry,material);

    	mesh.position.set(10 * getRandom(),10 * getRandom(),0);

    	_meshes.push(mesh);
		_scene.add(mesh);
		
	}

    /* =======================================================================
	Update
	========================================================================== */
    private static function update(time:Float):Void {

		window.requestAnimationFrame(update);

		for (mesh in _meshes) {

			mesh.rotation.x += .05;
			mesh.rotation.y += .05;
			mesh.rotation.z += .05;

		}

		var rad:Float = _mouseX / window.innerWidth * Math.PI * 2;

        _camera.position.set(Math.cos(rad),Math.tan(rad),Math.sin(rad));
        _camera.lookAt(new Vector3());

		_renderer.render(_scene,_camera);

	}

	/* =======================================================================
	On Mousemove
	========================================================================== */
    private static function onMousemove(event:MouseEvent):Void {

    	_mouseX = event.clientX;
    	_mouseY = event.clientY;

	}

	/* =======================================================================
	Get Random
	========================================================================== */
    private static function getRandom():Float {

		return Math.random() - Math.random();

	}

}