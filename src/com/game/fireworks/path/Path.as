package com.game.fireworks.path {
	import com.game.fireworks.tilemap.FireTile;
	import com.game.fireworks.tilemap.FireGrid;
	/**
	 * @author wbguan
	 */
	public class Path extends Object {
		private var _grid:FireGrid;
		private var _fireMap:Object = {};
		private var _heads:Array = [];
		private var _currentHead:int = 0;
		private var _readyArray:Array = [];
		private var _buffer:Array = [];
		public function Path(param:FireGrid) {
			this._grid = param;
			var len:int = this._grid.len;
			for(var i:int = 0;i<len;i=i+this._grid.column){
				_heads.push(i);
			}
		}
		public function searchPath():void{
			_readyArray = new Array();
			for each(var i:int in _heads){
				_currentHead = i;
				_buffer = new Array();
				search(i);
			}
			trace(JSON.stringify(_fireMap));
		}
		private function search(i:int):void{
			var fireTile:FireTile = this._grid.tiles[i] as FireTile;
			top(fireTile);
			bottom(fireTile);
			right(fireTile);
		}
		
		private function top(fireTile:FireTile):void{
			var t:FireTile = fireTile.nbTop;
			if(t != null){
				if(fireTile.t>0 && t.b>0&&!contained(t.index)){
					_readyArray.push(t.index);
					_buffer.push(t.index);
					search(t.index);
				}
			}
		}

		private function contained( index : int) : Boolean {
			var arr:Array = _readyArray;
			var result:Boolean = false;
			var len:int = arr.length;
			for(var i:int = len - 1;i>=0;i--){ 
				if(arr[i] == index){
				  result = true;
				  break;
				}
			}
			return result;
		}
		private function right(fireTile:FireTile):void{
			var r:FireTile = fireTile.nbRight;
			if(r != null){
				if(fireTile.r>0 && r.l>0&&!contained(r.index)){
					_readyArray.push(r.index);
					_buffer.push(r.index);
					if(r.nbRight == null && r.nbRight.r > 0){
						this._fireMap[_currentHead] = _buffer;
					}
					search(r.index);
				}
			}
		}
		private function bottom(fireTile:FireTile):void{
			var b:FireTile = fireTile.nbBottom;
			if(b != null){
				if(fireTile.b > 0 && b.t>0 && !contained(b.index)){
					_readyArray.push(b.index);
					_buffer.push(b.index);
					search(b.index);
				}
			}
		}
		
	}
}
