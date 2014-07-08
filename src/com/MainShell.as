package com {
	import com.system.AppMain;
	import starling.core.Starling;
	import flash.display.Sprite;

	/**
	 * @author wbguan
	 */
	public class MainShell extends Sprite {
		private var _starling:Starling;
		public function MainShell() {
			_starling = new Starling(AppMain, stage, null, null, "auto", ["baselineExtended", "baseline"]);
		}
	}
}
