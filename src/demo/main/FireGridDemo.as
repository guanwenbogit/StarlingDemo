package demo.main {
	import com.path.INote;
	import com.game.fireworks.path.FirePath;
	import starling.display.Sprite;

	import com.game.fireworks.tilemap.FireGrid;
	import com.game.fireworks.tilemap.FireTile;
	import com.game.fireworks.tilemap.TileELement;
	import com.game.fireworks.tilemap.event.GridChangeEvent;
	import com.path.Path;
	/**
	 * @author wbguan
	 */
	public class FireGridDemo extends Object {
		private var _view:Sprite;
		private var _path:FirePath;
		public function FireGridDemo() {
			var grid:FireGrid = new FireGrid();
			_view = new Sprite();
			grid.dispatcher.addEventListener(GridChangeEvent.TURN, onTurn);
			for each(var fireTile:FireTile in grid.tiles){
				var data:Object = {};
				var arr:Array = new Array();
				var count:int = 0;
				for(var i:int = 0; i<4;i++){
					var value:int =  int(Math.random()*100)%2;
					if(value == 1){
						count++;
					}
					if(i-count >2){
						value = 1;
					}
					arr.push(value);
					count = 0;
				}
				data["l"] = arr[0];
				data["t"] = arr[1];
				data["r"] = arr[2];
				data["b"] = arr[3];
				fireTile.update(data);
				var element:TileELement = new TileELement();
				element.update(fireTile);
				_view.addChild(element);
				
			}
			_path = new FirePath(grid);
			_path.search(null);
		}

		private function onTurn(event : GridChangeEvent) : void {
			_path.search(event.data as INote);
		}

		public function get view() : Sprite {
			return _view;
		}
	}
}
