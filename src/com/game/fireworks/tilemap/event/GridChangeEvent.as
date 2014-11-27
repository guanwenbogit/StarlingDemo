package com.game.fireworks.tilemap.event {
	import starling.events.Event;

	/**
	 * @author wbguan
	 */
	public class GridChangeEvent extends Event {
		public static const TURN : String = "TURN";
		public static const MARK : String = "MARK";
		public function GridChangeEvent(type : String,bubbles : Boolean = true, data : Object = null) {
			super(type, bubbles, data);
		}
	}
}
