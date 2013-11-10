package view.game.stage 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class StageGameEvent extends Event 
	{
		
		public static const TICK:String = "onTick";
		public static const CLICK:String = "onClick";
		
		private var _x:int;
		private var _y:int;
		
		public function StageGameEvent(type:String, x:int, y:int) 
		{
			super(type);
			_x = x;
			_y = y;
		}
		
		public function get x():int 
		{
			return _x;
		}
		
		public function get y():int 
		{
			return _y;
		}
		
	}

}