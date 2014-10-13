package demo.main {
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.display.Sprite;

	/**
	 * @author wbguan
	 */
	public class Welcome extends Sprite {
		[Embed(source="a.png")]
		private var PNG : Class;
		public function Welcome() {
			// text.text = "hello starling";
			var text : TextField = new TextField(50, 50, "123");
			text.x = 50;
			text.y = 50;
			this.addChild(text);
			var texture:Texture = Texture.fromBitmap(new PNG());
			for (var i:int = 0 ; i<1000;i++){
			  var image:Image = new Image(texture);
			  image.x = Math.random()*1000;
			  image.y = Math.random()*1000;
			  this.addChild(image);
			}
			trace("welcome");
		}
	}
}
