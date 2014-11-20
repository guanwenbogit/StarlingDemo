package com.game.fireworks.tilemap {
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.display.Quad;
	import starling.display.Sprite;

	/**
	 * @author wbguan
	 */
	public class TileELement extends Sprite {
		private var l:Quad;
		private var t:Quad;
		private var r:Quad;
		private var b:Quad;
		private var _bg:Quad;
		private var _qsize:int = 16;
		private var _offSet:int = -16;
		private var _center:Quad;
		public function TileELement() {
			l = new Quad(_qsize, _qsize);
			t = new Quad(_qsize, _qsize);
			r = new Quad(_qsize, _qsize);
			b = new Quad(_qsize, _qsize);
			this.addChild(l);
			this.addChild(t);
			this.addChild(r);
			this.addChild(b);
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			_center = new Quad(_qsize, _qsize,0x00cc00);
		}

		private function onTouch(event : TouchEvent) : void {
			var touch:Touch = event.getTouch(this);
			if(touch != null && touch.phase == TouchPhase.ENDED){
			  this.rotation += Math.PI/2;
			}
 		}
		
		public function update(param:FireTile):void{
			_bg = new Quad(param.w, param.h,0xffcc99);
			l.color = param.l > 0?  0x00cc00:0xffcc99;
			t.color = param.t > 0?  0x00cc00:0xffcc99;
			r.color = param.r > 0?  0x00cc00:0xffcc99;
			b.color = param.b > 0?  0x00cc00:0xffcc99;
			if(!this.contains(_bg)){
				this.addChildAt(this._bg,0);
				this._bg.x = this._bg.y = _offSet;
			}
			l.x = 0+_offSet;l.y = int((param.h - l.height)/2)+_offSet;
			t.x = int((param.w - t.width)/2)+_offSet;t.y = 0+_offSet;
			r.x = param.w - r.width+_offSet;r.y = int((param.w - r.width)/2)+_offSet;
			b.x = int((param.w - b.width)/2)+_offSet;b.y = param.h - b.height+_offSet;
			this.x = param.xy.x * (this.width + 1);
			this.y = param.xy.y * (this.height + 1);
			if(!this.contains(_center)){
				this.addChild(this._center);
				_center.x = int((param.w - _center.width)/2)+_offSet;
				_center.y = int((param.h - _center.height)/2)+_offSet;
			}
		}
		
	}
}
