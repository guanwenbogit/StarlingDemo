package util.layout.iLayout {
	import starling.display.DisplayObject;
	/**
	 * @author wbguan
	 */
	public interface IContainer {
		function resize() : void;

		function add(param:DisplayObject,modex:String,modey:String) : void;
	}
}
