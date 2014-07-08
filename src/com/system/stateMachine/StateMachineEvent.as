package com.system.stateMachine {
	import com.system.stateMachine.states.State;
	import flash.events.Event;

	/**
	 * @author wbguan
	 */
	public class StateMachineEvent extends Event {
		public static const STATE_CHANGE:String = "STATE_CHANGE";
		private var _param:State ;
		public function StateMachineEvent(type : String,param:State = null, bubbles : Boolean = true, cancelable : Boolean = false) {
			this._param = param;
			super(type, bubbles, cancelable);
		}
		override public function clone():Event{
			return new StateMachineEvent(type, _param, bubbles, cancelable);
		}

		public function get param() : State {
			return _param;
		}
	}
}
