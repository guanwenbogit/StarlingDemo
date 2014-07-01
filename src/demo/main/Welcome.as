package demo.main {
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.display.Sprite;

	/**
	 * @author wbguan
	 */
	public class Welcome extends Sprite {
		public function Welcome() {
			// text.text = "hello starling";
			var text : TextField = new TextField(50, 50, "123");
			text.x = 50;
			text.y = 50;
			this.addChild(text);
			var q:Quad = new Quad(50, 50,0x123456);
			this.addChild(q);
			trace("welcome");
		}
	}
}
