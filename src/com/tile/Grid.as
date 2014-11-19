package com.tile {
	/**
	 * @author wbguan
	 */
	public class Grid extends Object {
		protected const DEFAULT_SIZE:int = 32;
		protected var _column:int = 0;
		protected var _row : int = 0;
		protected var _tiles : Vector.<Tile> = new Vector.<Tile>();
		private var _map:Object = {};
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
				tile.xy.x = i % this._column ;
				tile.xy.y = int(i / this._column);
				tile.position.x = i % this._column * tile.w;
				tile.position.y = int(i / this._column) * tile.h;
				_tiles.push(tile);
				_map[tile.xy.x+""+tile.xy.y] = tile;
		   }
		}

		protected function creatTile(index:int) : Tile {
			var result:Tile;
			result = new Tile();
			result.index = index;
			result.w = result.h = DEFAULT_SIZE;
			return result;
		}

		public function getTileByXY(x:int,y:int) : Tile {
			var result:Tile;
			result = this._map[x+""+y];
			return result;
		}

		public function get tiles() : Vector.<Tile> {
			return _tiles;
		}

		public function get column() : int {
			return _column;
		}

		public function get row() : int {
			return _row;
		}

		public function get len() : int {
			return _len;
		}
		
	}
}
