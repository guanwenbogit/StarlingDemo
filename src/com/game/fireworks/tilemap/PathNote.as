package com.game.fireworks.tilemap {
	import com.game.fireworks.tilemap.FireTile;
	import com.path.INote;

	/**
	 * @author wbguan
	 */
	public class PathNote extends FireTile implements INote {
		public function PathNote() {
			super();
		}
        protected var _data:Object;
		private var _lNote:PathNote;
		public function get lNote() : PathNote {
			return _lNote;
		}
		public function set lNote(lNote : PathNote) : void {
			_lNote = lNote;
		}
		private var _tNote:PathNote;
			public function get tNote() : PathNote {
			return _tNote;
		}

		public function set tNote(tNote : PathNote) : void {
			_tNote = tNote;
		}
		private var _rNote:PathNote;
			public function get rNote() : PathNote {
			return _rNote;
		}

		public function set rNote(rNote : PathNote) : void {
			_rNote = rNote;
		}
		private var _bNote:PathNote;
			public function get bNote() : PathNote {
			return _bNote;
		}

		public function set bNote(bNote : PathNote) : void {
			_bNote = bNote;
		}
		public function init(data:Object):void{
			this._data = data;
		}

		
		
	}
}
