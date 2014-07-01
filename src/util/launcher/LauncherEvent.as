package util.launcher {
	import flash.events.Event;

	/**
	 * @author wbguan
	 */
	public class LauncherEvent extends Event {
		public var param:String = "";
		public function LauncherEvent(type : String, param:String = "",bubbles : Boolean = true, cancelable : Boolean = false) {
			this.param = param;
			super(type, bubbles, cancelable);
		}
		override public function clone():Event{
			return new LauncherEvent(type, param,bubbles,cancelable);
		}
	}
}
