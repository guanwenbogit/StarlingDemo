package com.system.stateMachine.states {
	/**
	 * @author wbguan
	 */
	public class State extends Object {
		private var _name:String = "";
		public function get name():String{
			return this._name;
		}
		public function State(name:String) {
			this._name = name;
		}
	}
}
