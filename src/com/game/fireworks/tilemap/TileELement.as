package com.game.fireworks.tilemap {
	import com.game.fireworks.tilemap.event.GridChangeEvent;
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
		private var _core:FireTile;
		public function TileELement() {
			l = new Quad(_qsize, _qsize);
			t = new Quad(_qsize, _qsize);
			r = new Quad(_qsize, _qsize);
			b = new Quad(_qsize, _qsize);
			
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			_center = new Quad(_qsize, _qsize,0x00cc00);
		}

		private function onTouch(event : TouchEvent) : void {
			var touch:Touch = event.getTouch(this);
			if(touch != null && touch.phase == TouchPhase.BEGAN && this._core != null){
			  this.rotation += Math.PI/2;
			  _core.turn90();
			}else if(touch != null && touch.phase == TouchPhase.MOVED){
//				_core.markNeighbour(3);
			}else if(touch != null && touch.phase == TouchPhase.ENDED){
//				_core.markNeighbour(0);
			}
 		}
		
		public function update(param:FireTile):void{
			_core = param;
			_core.dispatcher.addEventListener(GridChangeEvent.MARK, onMark);
			if(_bg == null){
			  _bg = new Quad(param.w, param.h,0xffcc99);
			}
			l.color = param.l > 0?  0x00cc00:0xffcc99;
			t.color = param.t > 0?  0x00cc00:0xffcc99;
			r.color = param.r > 0?  0x00cc00:0xffcc99;
			b.color = param.b > 0?  0x00cc00:0xffcc99;
			addToParent();
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

		private function addToParent() : void {
			if(_core.l>0){
			  this.addChild(l);
			}
			if(_core.t > 0){
			  this.addChild(t);
			}
			if(_core.r > 0){
			  this.addChild(r);
			}
			if(_core.b > 0){
			  this.addChild(b);
			}
		}

		private function onMark(event : GridChangeEvent) : void {
			if(_core.state.state == 1){
				_bg.color = 0xffcc00;
			}else if(_core.state.state == 2){
				_bg.color = 0xff0055;
			}else if(_core.state.state == 3){
				_bg.color = 0x555555;
			}else if(_core.state.state == 4){
				_bg.color = 0x00cc00;
			}else{
				_bg.color = 0xffcc99;
			}
		}
		
	}
}
