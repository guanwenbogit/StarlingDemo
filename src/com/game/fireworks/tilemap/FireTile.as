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
		private var _neighbours:Vector.<FireTile> = new Vector.<FireTile>();
		private var _parent:FireTile;
		private var _nbTop:FireTile;
		private var _nbBottom:FireTile;
		private var _nbRight:FireTile;
		public function FireTile() {
			super();
		}

		public function turn90() : void {
			var tmp:int = _t;
			_t = _l;
			_l = _b;
			_b = _r;
			_r = tmp;
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

		public function get neighbours() : Vector.<FireTile> {
			return _neighbours;
		}

		public function set nbTop(nbTop : FireTile) : void {
			_nbTop = nbTop;
		}

		public function get nbTop() : FireTile {
			return _nbTop;
		}

		public function get nbBottom() : FireTile {
			return _nbBottom;
		}

		public function set nbBottom(nbLeft : FireTile) : void {
			_nbBottom = nbLeft;
		}

		public function get nbRight() : FireTile {
			return _nbRight;
		}

		public function set nbRight(nbRight : FireTile) : void {
			_nbRight = nbRight;
		}
	}
}
