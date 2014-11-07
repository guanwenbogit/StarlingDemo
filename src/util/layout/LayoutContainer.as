package util.layout {
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import util.layout.iLayout.IContainer;

	/**
	 * @author wbguan
	 */
	public class LayoutContainer extends Object implements IContainer {
		public static const LEFT:String = "left";
		public static const RIGHT:String = "right";
		public static const BOTTOM:String = "bottom";
		public static const TOP:String = "top";
		public static const CENTER:String = "center";
		private var _sprite:Sprite;
		private var _xc:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _l:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _r:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _yc:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _t:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _b:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _autox:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _autoy:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		private var _obj:Vector.<DisplayObject> = new Vector.<DisplayObject>();
		
		public function LayoutContainer() {
			_sprite = new Sprite();
		}

		public function add(param:DisplayObject,modex:String = "",modey:String = "") : void {
			if(modex == LEFT){
				_l.push(param);
				param.x = 0;
			}else if(modex == RIGHT){
				_r.push(param);
			}else if(modex == CENTER){
				_xc.push(param);
			}else{
				_autox.push(param);
			}
			if(modey == TOP){
				_t.push(param);
			}else if(modey == BOTTOM){
				_b.push(param);
			}else if(modey == CENTER){
				_yc.push(param);
			}else{
				_autoy.push(param);
			}
			_sprite.addChild(param);
		}

		public function resize() : void {
			
		}

		public function getSprite() : Sprite {
			return _sprite;
		}
		
	}
}
