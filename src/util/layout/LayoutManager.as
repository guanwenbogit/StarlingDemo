package util.layout {
	import starling.display.DisplayObject;
	import starling.display.Stage;
	import util.layout.iLayout.IContainer;
	/**
	 * @author wbguan
	 */
	public class LayoutManager extends Object {
		private var _map:Object = {};
		private var _containers:Vector.<IContainer> = new Vector.<IContainer>();
		private var _appstage:Stage;
		public function LayoutManager() {
		}

		public function init(stage:Stage) : void {
			this._appstage = stage;
		}

		public function stageResize():void{
			for each(var c:IContainer in _containers){
				c.resize();
			}
		}

		public function addContainer(key:String,container:IContainer) : void {
			_map[key] = container;
			_containers.push(container);
			_appstage.addChild(container as DisplayObject);
		}
        
		public function get containers() : Vector.<IContainer> {
			return _containers;
		}
		
	}
}
