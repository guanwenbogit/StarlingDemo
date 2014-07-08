package com.system.stateMachine {
	import flash.events.EventDispatcher;
	import com.system.stateMachine.states.State;
	/**
	 * @author wbguan
	 */
	public class StateMachine extends EventDispatcher {
		protected static const WELCOME:String = "WELCOME";
		protected static const INIT:String = "INIT";
		protected static const TRANSITIONS:String = "TRANSITIONS";
		protected static const OVER:String = "OVER";
		protected static const NEXTSTAGE:String = "NEXTSTAGE";
		
		private var _currentState:State;
		public function StateMachine() {
		}
		private function change():void{
			this.dispatchEvent(new StateMachineEvent(StateMachineEvent.STATE_CHANGE,this._currentState));
		}
		public function welcome():void{
			_currentState = new State(WELCOME);
			change();
		}
        public function init():void{
			_currentState = new State(INIT);
			change();
		}
		public function transitions():void{
			_currentState = new State(TRANSITIONS);
			change();
		}
		public function over():void{
			_currentState = new State(OVER);
			change();
		}
		
	}
}
