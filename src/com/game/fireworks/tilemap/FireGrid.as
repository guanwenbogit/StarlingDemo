package com.game.fireworks.tilemap {
	import com.tile.Grid;

	/**
	 * @author wbguan
	 */
	public class FireGrid extends Grid {
		public function FireGrid(r : int = 9, c : int = 6) {
			super(r, c);
		}
		public function updateTile(index:int,data:Object):void{
			var tmp:FireTile = this._tiles[index] as FireTile;
			tmp.update(data);
		}

		public function getLeftTiles() : Vector.<FireTile>{
			var result:Vector.<FireTile>;
			for(var i:int = 0 ; i < _tiles.length;i=i+this._column){
				result.push(this._tiles[i]);
			}
			return result;
		}

		public function getRightTiles() : Vector.<FireTile> {
			var result:Vector.<FireTile>;
			for(var i:int = this._column - 1 ; i < _tiles.length;i=i+this._column){
				result.push(this._tiles[i]);
			}
			return result;
		}

		public function getNeighbous(tile:FireTile) : Vector.<FireTile> {
			var result:Vector.<FireTile>;
			var l:int = tile.index - 1;
			var t:int = tile.index - this._column;
			var r:int = tile.index + 1;
			var b:int = tile.index + this._column;
			if(tile.xy.x<this._column-1){
				result.push(this.getTileByXY(tile.xy.x+1, tile.xy.y));
			}
			if(tile.xy.y>0){
				result.push(this.getTileByXY(tile.xy.x, tile.xy.y-1));
			}
			if(tile.xy.y<this._row - 1){
				result.push(this.getTileByXY(tile.xy.x, tile.xy.y+1));
			}
			return result;
		}
        
		
	}
}
