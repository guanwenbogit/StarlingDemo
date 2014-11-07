package com.game.fireworks.tilemap {
	import com.tile.Tile;

	/**
	 * @author wbguan
	 */
	public class FireTile extends Tile {
		private var _l:int = 0;
		private var _t:int = 0;
		private var _r:int = 0;
		private var _b:int = 0;
		public function FireTile() {
			super();
		}

		public function get l() : int {
			return _l;
		}

		public function set l(l : int) : void {
			_l = l;
		}

		public function get t() : int {
			return _t;
		}

		public function set t(t : int) : void {
			_t = t;
		}

		public function get r() : int {
			return _r;
		}

		public function set r(r : int) : void {
			_r = r;
		}

		public function get b() : int {
			return _b;
		}

		public function set b(b : int) : void {
			_b = b;
		}

		public function update(data : Object) : void {
		}
	}
}
