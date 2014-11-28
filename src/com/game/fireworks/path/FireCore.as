package com.game.fireworks.path {
	import flash.utils.getTimer;
	import com.game.fireworks.tilemap.FireGrid;
	import com.game.fireworks.tilemap.PathNote;
	import com.path.INote;
	import com.path.PathCore;

	/**
	 * @author wbguan
	 */
	public class FireCore extends PathCore {
		private var _grid:FireGrid;
		private var _yellowSeeds : Vector.<PathNote> = new Vector.<PathNote>();
		private var _redSeeds : Vector.<PathNote> = new Vector.<PathNote>();
		private var _whiteHouse:Object = {};
		private var _markBuffer:Vector.<PathNote> = new Vector.<PathNote>();
		public function FireCore(param:FireGrid) {
			this._grid = param;
			for each(var note:PathNote in this._grid.tiles){
				_whiteHouse[note.index] = note;
			}
			super();
		}
		override public function excute(note:INote):void{
			var tmp:PathNote = note as PathNote;
			left(tmp);
			top(tmp);
			right(tmp);
			bottom(tmp);
		}
		override public function search():void{
			clearSeeds();
			checkSeeds();
			mark();
		}
        override public function resetRelate(note:INote):void{
			if(note == null){
				return;
			}
			var tmp:PathNote = note as PathNote;
			var l:PathNote = tmp.lNote;
			var r:PathNote = tmp.rNote;
			var t:PathNote = tmp.tNote;
			var b:PathNote = tmp.bNote;
			if(l == null){
				left(tmp);
			}else{
				if(!(tmp.l > 0 && l.r > 0)){
					l.rNote = tmp.lNote = null;
				}
			}
			if(t == null){
				top(tmp);
			}else{
				if(!(tmp.t > 0 && t.b > 0)){
					t.bNote = tmp.tNote = null;
				}
			}
			if(r == null){
				right(tmp);
			}else{
				if(!(tmp.r > 0 && r.l > 0)){
					r.lNote = tmp.rNote = null;
				}
			}
			if(b == null){
				bottom(tmp);
			}else{
				if(!(tmp.b > 0 && b.t > 0)){
					b.tNote = tmp.bNote = null;
				}
			}
		}
		protected function mark() : void {
			for each(var note:PathNote in this._grid.tiles){
				_whiteHouse[note.index] = note;
			}
			var last:Number = getTimer();
			markYellow();
			markRed();
			markWhite();
			trace("========= " + (getTimer() - last));
		}
        private function clearMark():void{
			while(this._markBuffer.length > 0){
				this._markBuffer.pop();
			}
		}
		private function isMarked(param:PathNote):Boolean{
			var result:Boolean = false;
			for each(var note:PathNote in this._markBuffer){
				if(note.index == param.index){
					result = true;
					break;
				}
			}
			return result;
		}
		private function markWhite() : void {
			for(var key:Object in this._whiteHouse){
				var note:PathNote = this._whiteHouse[key];
				if(note != null){
					note.setWhite();
				}
			}
		}
        private var count:int = 0;
		private function markRed() : void {
			clearMark();
			count = 0;
			for each(var note:PathNote in this._redSeeds){
				note.setRed();
				this._whiteHouse[note.index] = null;
				nextNote(note.lNote,note,"setRed");
				nextNote(note.tNote,note,"setRed");
				nextNote(note.bNote,note,"setRed");
			}
			trace("=========== red count : " + count);
		}

		private function markYellow() : void {
			clearMark();
			count = 0;
			for each(var note:PathNote in this._yellowSeeds){
				note.setYellow();
				this._whiteHouse[note.index] = null;
				nextNote(note.tNote,note,"setYellow");
				nextNote(note.rNote,note,"setYellow");
				nextNote(note.bNote,note,"setYellow");
			}
			trace("=========== yellow count : " + count);
		}

		private function nextNote(note : PathNote, parent : PathNote,funcStr:String) : void {
			if(note != null && !isMarked(note)){
				count++;
				var func:Function = note[funcStr] as Function;
				func();
				this._whiteHouse[note.index] = null;
				this._markBuffer.push(note);
				if(note.lNote != parent){
				  nextNote(note.lNote,note,funcStr);
				}
				if(note.tNote != parent){
				  nextNote(note.tNote,note,funcStr);
				}
				if(note.rNote != parent){
				  nextNote(note.rNote,note,funcStr);
				}
				if(note.bNote != parent){
				  nextNote(note.bNote,note,funcStr);
				}
			}
		}
		protected function bottom(note : PathNote) : void {
			var bn:PathNote = this._grid.getPathNoteByXY(note.xy.x, note.xy.y+1);
			if(bn != null && note.b > 0 && note.bNote == null && bn.t > 0){
				note.bNote = bn;
				bn.tNote = note;
			}
		}
		protected function right(note : PathNote) : void {
			var rn:PathNote = this._grid.getPathNoteByXY(note.xy.x+1, note.xy.y);
			if(rn != null && note.r > 0 && note.rNote == null && rn.l > 0){
				note.rNote = rn;
				rn.lNote = note;
			}
		}

		protected function top(note : PathNote) : void {
			var tn:PathNote = this._grid.getPathNoteByXY(note.xy.x, note.xy.y-1);
			if(tn != null && note.t > 0 && note.tNote == null && tn.b >0){
				note.tNote = tn;
				tn.bNote = note;
			}
		}

		protected function left(note : PathNote) : void {
			var ln:PathNote = this._grid.getPathNoteByXY(note.xy.x - 1, note.xy.y);
			if(ln != null && note.l > 0 && note.lNote == null && ln.r > 0){
				note.lNote = ln;
				ln.rNote = note;
			}
		}
		private function checkSeeds() : void {
			var note : PathNote;
			for each (note in this._grid.getLeftNote()) {
				if (note.l > 0) {
					this._yellowSeeds.push(note);
				}
			}
			for each (note in this._grid.getRightNote()) {
				if (note.r > 0) {
					this._redSeeds.push(note);
				}
			}
		}

		private function clearSeeds() : void {
			while (this._yellowSeeds.length > 0) {
				this._yellowSeeds.pop();
			}
			while (this._redSeeds.length > 0) {
				this._redSeeds.pop();
			}
		}
	}
}
