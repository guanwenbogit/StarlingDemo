package com.game.fireworks.tilemap {
	import flash.net.FileReference;
	import com.tile.Grid;

	/**
	 * @author wbguan
	 */
	public class FireGrid extends Grid {
		public function FireGrid(r : int = 8, c : int = 5) {
			super(r, c);
		}
		public function updateTile(index:int,data:Object):void{
			var tmp:FireTile = this._tiles[index] as FireTile;
			tmp.update(data);
		}
	}
}
