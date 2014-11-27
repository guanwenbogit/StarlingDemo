package com.game.fireworks.tilemap {
	import com.game.fireworks.tilemap.event.GridChangeEvent;
	import starling.events.EventDispatcher;
	import com.tile.Tile;

	/**
	 * @author wbguan
	 */
	public class FireTile extends Tile {
		public var dispatcher:EventDispatcher = new EventDispatcher();
		private var _l:int = 0;
		private var _t:int = 0;
		private var _r:int = 0;
		private var _b:int = 0;
		private var _neighbours:Vector.<FireTile> = new Vector.<FireTile>();
		private var _lastMark:int = 0;
		private var _mark : int = 0;
		private var _state : FireState;
		public function FireTile() {
			_state = new FireState();
			super();
		}

		public function turn90() : void {
			var tmp:int = _t;
			_t = _l;
			_l = _b;
			_b = _r;
			_r = tmp;
			dispatcher.dispatchEvent(new GridChangeEvent(GridChangeEvent.TURN,true,this));
		}
		public function setLastMark(lastMark:int):void{
			this._lastMark = lastMark;
			dispatcher.dispatchEvent(new GridChangeEvent(GridChangeEvent.MARK));
		}
        public function setMark(mode:int):void{
			this._mark = mode;
			dispatcher.dispatchEvent(new GridChangeEvent(GridChangeEvent.MARK));
		}
		public function setYellow() : void {
			this._state.state = FireState.YELLOW;
			dispatcher.dispatchEvent(new GridChangeEvent(GridChangeEvent.MARK));
		}
		public function setWhite():void{
			this._state.state = FireState.WHITE;
			dispatcher.dispatchEvent(new GridChangeEvent(GridChangeEvent.MARK));
		}
		public function setRed():void{
			this._state.state = FireState.RED;
			dispatcher.dispatchEvent(new GridChangeEvent(GridChangeEvent.MARK));
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
			_l = data["l"];
			_t = data["t"];
			_r = data["r"];
			_b = data["b"];
		}

		public function get neighbours() : Vector.<FireTile> {
			return _neighbours;
		}


		public function traceData() : String {
			return "[ l : " + _l + " t : " + _t + " r : " + _r + " b : " + _b + " ] ";
		}

		public function get mark() : int {
			return _mark;
		}

		public function get lastMark() : int {
			return _lastMark;
		}

		public function get state() : FireState {
			return _state;
		}

	}
}
