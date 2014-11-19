package demo.main {
	import com.game.fireworks.tilemap.FireTile;
	import com.game.fireworks.tilemap.FireGrid;
	/**
	 * @author wbguan
	 */
	public class FireGridDemo extends Object {
		public function FireGridDemo() {
			var grid:FireGrid = new FireGrid();
			for each(var fireTile:FireTile in grid.tiles){
				var data:Object = {};
				data["l"] = int(Math.random()*100)%2;
				data["t"] = int(Math.random()*100)%2;
				data["r"] = int(Math.random()*100)%2;
				data["b"] = int(Math.random()*100)%2;
				fireTile.update(data);
			}
			grid.traceData();
		}
	}
}
