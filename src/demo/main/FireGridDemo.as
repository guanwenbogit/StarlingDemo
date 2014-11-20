package demo.main {
	import com.game.fireworks.tilemap.TileELement;
	import starling.display.Sprite;
	import com.game.fireworks.tilemap.FireTile;
	import com.game.fireworks.tilemap.FireGrid;
	/**
	 * @author wbguan
	 */
	public class FireGridDemo extends Object {
		private var _view:Sprite;
		public function FireGridDemo() {
			_view = new Sprite();
			var grid:FireGrid = new FireGrid();
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
			grid.traceData();
		}

		public function get view() : Sprite {
			return _view;
		}
	}
}
