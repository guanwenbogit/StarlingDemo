package demo.main {
	import util.launcher.LauncherEvent;
	import util.launcher.LaunchManager;
	import starling.display.Sprite;

	/**
	 * @author wbguan
	 */
	public class Launcher extends Sprite {
		private var launcher:LaunchManager;
		public function Launcher() {
			launcher = new LaunchManager();
			var dic:Array = new Array();
			dic.push({name:"car13",url:"car13.swf"});
            dic.push({name:"car14",url:"car14.swf"});
			launcher.prepare(dic);
			launcher.dispatcher.addEventListener(LaunchManager.SETUP_EVENT, onSetup);
			launcher.dispatcher.addEventListener(LaunchManager.LAUNCH_COMPLETE_EVENT, onLaunch);
			launcher.setup();
		}

		private function onLaunch(event : LauncherEvent) : void {
			trace(event.param);
		}

		private function onSetup(event : LauncherEvent) : void {
			trace("class : " + event.param);
		}
	}
}
