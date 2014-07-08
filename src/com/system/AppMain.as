package com.system {
	import com.system.configs.Config;
	import com.system.driver.Driver;
	import com.system.stateMachine.StateMachineEvent;
	import starling.display.Sprite;

	import com.system.stateMachine.StateMachine;

	/**
	 * @author wbguan
	 */
	public class AppMain extends Sprite {
		private var _driver:Driver;
		private var _systemManager:SystemManager;
		private var _config:Config;
		private var _machine:StateMachine;
		private var _game:Game;
		private var _scene:Scene;
		public function AppMain() {
			initInstance();
		}
	    private function initInstance():void{
			this._driver = new Driver();
			this._systemManager = new SystemManager();
			this._machine = new StateMachine();
			this._machine.addEventListener(StateMachineEvent.STATE_CHANGE, onStageChange);
		}

		private function onStageChange(event : StateMachineEvent) : void {
			this._driver.navigate(event.param.name);
		}
		
	}
}
