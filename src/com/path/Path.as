package com.path {
	import com.tile.Grid;
	import com.tile.Tile;
	import com.game.fireworks.tilemap.FireTile;
	import com.game.fireworks.tilemap.FireGrid;
	/**
	 * @author wbguan
	 */
	public class Path extends Object {
		private var _grid:Grid;
		private var _allNotes:Vector.<INote>;
		private var _whiteHouse : Vector.<INote>;
		protected var _core : PathCore;
		public function Path(param:Grid) {
			this._grid = param;
			this.initInstance();
			initNotes();
			setRelation();
		}
		
		protected function setRelation():void{
			for each(var note:INote in this._allNotes){
				analysis(note);
			}
		}
		
		protected function initInstance():void{
			this._allNotes = new Vector.<INote>();
			this._whiteHouse = new Vector.<INote>();
			createCore();
		}
		protected function initNotes():void{
			for each(var data:Object in _grid.tiles){
				var note:INote = createNote(data);
				this._allNotes.push(note);
			}
		}
		protected function createCore():void{
			this._core = new PathCore();
		}
		protected function createNote(data:Object):INote{
			var result:INote;
			
			return result;
		}
		protected function analysis(note : INote) : void {
			this._core.excute(note);
		}

		public function get grid() : Grid {
			return _grid;
		}

		public function get allNotes() : Vector.<INote> {
			return _allNotes;
		}

		public function get whiteHouse() : Vector.<INote> {
			return _whiteHouse;
		}
	}
}
