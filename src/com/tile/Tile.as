package com.tile {
	import flash.geom.Point;
	/**
	 * @author wbguan
	 */
	public class Tile extends Object {
		private var _index:int = 0;
		public function get index():int{
			return _index;
		}

		public function set index(value:int) : void {
			this._index = value;
		}
        
		private var _position:Point = new Point();        
		public function Tile() {
		}
        private var _w:int = 0;
		private var _h:int = 0;
		public function get position() : Point {
			return _position;
		}

		public function set position(position : Point) : void {
			_position = position;
		}
        private var _xy:Point = new Point();
		public function get w() : int {
			return _w;
		}

		public function get h() : int {
			return _h;
		}

		public function set w(w : int) : void {
			_w = w;
		}

		public function set h(h : int) : void {
			_h = h;
		}

		public function set xy(xy : Point) : void {
			_xy = xy;
		}

		public function get xy() : Point {
			return _xy;
		}
		
	}
}
