package com.game.fireworks.tilemap {
	import com.game.fireworks.tilemap.event.GridChangeEvent;
	import starling.events.EventDispatcher;
	import com.tile.Tile;
	import com.tile.Grid;

	/**
	 * @author wbguan
	 */
	public class FireGrid extends Grid {
		public var dispatcher:EventDispatcher = new EventDispatcher();
		public function FireGrid(r : int = 9, c : int = 6) {
			super(r, c);
			setNB();
		}

		private function setNB() : void {
			for each(var tile:Tile in this.tiles){
			}
		}
		public function updateTile(index:int,data:Object):void{
			var tmp:FireTile = this._tiles[index] as FireTile;
			tmp.update(data);
		}
        override protected function creatTile(index:int) : Tile {
			var result:Tile;
			var tmp:FireTile;
			tmp = new PathNote();
			tmp.dispatcher.addEventListener(GridChangeEvent.TURN, onTurn);
			result = tmp;
			result.index = index;
			result.w = result.h = DEFAULT_SIZE;
			return result;
		}

		private function onTurn(event : GridChangeEvent) : void {
			dispatcher.dispatchEvent(event);
		}
		public function getLeftTiles() : Vector.<FireTile>{
			var result:Vector.<FireTile> = new Vector.<FireTile>();
			for(var i:int = 0 ; i < _tiles.length;i=i+this._column){
				result.push(this._tiles[i]);
			}
			return result;
		}

		public function getRightTiles() : Vector.<FireTile> {
			var result:Vector.<FireTile> = new Vector.<FireTile>();
			for(var i:int = this._column - 1 ; i < _tiles.length;i=i+this._column){
				result.push(this._tiles[i]);
			}
			return result;
		}
        public function getPathNoteByXY(x:int,y:int):PathNote{
			var result:PathNote;
			var tmp:Tile = this.getTileByXY(x, y);
			if(tmp != null){
				result = tmp as PathNote;
			}
			return result;
		}
        public function getLeftNote():Vector.<PathNote>{
			var result:Vector.<PathNote>;
			result = Vector.<PathNote>(this.getLeftTiles());
			return result;
		}
		public function getRightNote():Vector.<PathNote>{
			var result:Vector.<PathNote>;
			result = Vector.<PathNote>(this.getRightTiles());
			return result;
		}
		public function mark() : void {
		}
		
	}
}
