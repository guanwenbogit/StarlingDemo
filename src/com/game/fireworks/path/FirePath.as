package com.game.fireworks.path {
	import com.path.INote;
	import com.game.fireworks.tilemap.FireGrid;
	import com.path.Path;
	import com.tile.Grid;

	/**
	 * @author wbguan
	 */
	public class FirePath extends Path {
		private var _grid : FireGrid;
		public function FirePath(param : Grid) {
			this._grid = param as FireGrid;
			super(param);
		}
        override protected function createCore():void{
			this._core = new FireCore(_grid);
		}
		override protected function createNote(data:Object):INote{
			var result:INote;
			result = data as INote;
			return result;
		}
		public function search(note:INote) : void {
			this._core.resetRelate(note);
			this._core.search();
		}
	}
}
