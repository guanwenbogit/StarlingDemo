package com.tile {
	/**
	 * @author wbguan
	 */
	public class Grid extends Object {
		private const DEFAULT_SIZE:int = 32;
		private var _column:int = 0;
		private var _row : int = 0;
		protected var _tiles : Vector.<Tile> = new Vector.<Tile>();
		private var _len:int = 0;
		public function Grid(r:int,c:int) {
			setVars(r, c);
			creatTiles();
		}
		
		private function setVars(r:int,c:int):void{
			this._column = c;
			this._row = r;
			this._len = this._column * this._row;
		}
		
		private function creatTiles():void{
		   for(var i:int = 0 ; i < this._len ; i++){
		      	var tile:Tile = creatTile(i);	
				tile.position.x = i % this._column * tile.w;
				tile.position.y = int(i / this._column) * tile.h;
				_tiles.push(tile);
		   }
		}

		protected function creatTile(index:int) : Tile {
			var result:Tile;
			result = new Tile();
			result.index = index;
			result.w = result.h = DEFAULT_SIZE;
			return result;
		}
		
	}
}
