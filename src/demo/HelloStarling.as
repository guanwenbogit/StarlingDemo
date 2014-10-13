package demo {
	import demo.main.Welcome;
	import com.MainShell;
	import demo.main.Launcher;
	import starling.core.Starling;
	import flash.display.Sprite;

	/**
	 * @author wbguan
	 */
	public class HelloStarling extends Sprite {
		private var _starling:Starling;
		public function HelloStarling() {
			_starling = new Starling( Welcome, stage, null, null, "auto", ["baselineExtended", "baseline"]);
			_starling.start();
		}
	}
}
