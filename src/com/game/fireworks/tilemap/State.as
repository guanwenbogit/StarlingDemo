package com.game.fireworks.tilemap {
	/**
	 * @author wbguan
	 */
	public class State extends Object {
		private var _state:int = 0;

		public function State() {
		}

		public function get state() : int {
			return _state;
		}

		public function set state(state : int) : void {
			if(_state != state){
			  _state = state;
			  excute();
			}
		}
		protected function excute():void{
			
		}
	}
}
