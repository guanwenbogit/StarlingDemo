package com.game.fireworks.tilemap {
	import com.tile.Tile;
	import com.tile.Grid;

	/**
	 * @author wbguan
	 */
	public class FireGrid extends Grid {
		public function FireGrid(r : int = 9, c : int = 6) {
			super(r, c);
			setNB();
		}

		private function setNB() : void {
			for each(var tile:Tile in this.tiles){
				getNeighbous(tile as FireTile);
			}
		}
		public function updateTile(index:int,data:Object):void{
			var tmp:FireTile = this._tiles[index] as FireTile;
			tmp.update(data);
		}
        override protected function creatTile(index:int) : Tile {
			var result:Tile;
			result = new FireTile();
			result.index = index;
			result.w = result.h = DEFAULT_SIZE;
			return result;
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
			var result:Vector.<FireTile> = new Vector.<FireTile>();
			var l:int = tile.index - 1;
			var t:int = tile.index - this._column;
			var r:int = tile.index + 1;
			var b:int = tile.index + this._column;
			var tmp:FireTile;
			if(tile.xy.x<this._column-1){
				tmp = this.getTileByXY(tile.xy.x+1, tile.xy.y) as FireTile;
				result.push(tmp);
				tile.nbRight = tmp;
			}
			if(tile.xy.y>0){
				tmp = this.getTileByXY(tile.xy.x, tile.xy.y-1) as FireTile;
				result.push(tmp);
				tile.nbTop = tmp;
			}
			if(tile.xy.y<this._row - 1){
				tmp = this.getTileByXY(tile.xy.x, tile.xy.y+1) as FireTile;
				result.push(tmp);
				tile.nbBottom = tmp;
			}
			return result;
		}
        public function traceData():void{
			var len:int = this._tiles.length;
			var str:String = "";
			for(var i:int = 0 ;i < len ; i++){
			    str += (this._tiles[i] as FireTile).traceData();
				if(i%this._column == 5){
					trace(str);
					str = "";
				}
			}
		}
		
	}
}
