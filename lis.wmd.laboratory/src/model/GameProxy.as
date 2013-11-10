package model 
{
	import flash.system.Capabilities;
	import org.mvcexpress.mvc.Proxy;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameProxy extends Proxy 
	{
		
		public var screenWidth:int;
		public var screenHeight:int;
		
		public var thisTickTime:Number;
		public var prevTickTime:Number;
		
		public var active:Boolean;
		public var enabled:Boolean;
		
		public function GameProxy() 
		{
			active = true;
			enabled = true;
			prevTickTime = thisTickTime = new Date().time;
			screenWidth = Capabilities.screenResolutionX;
			screenHeight = Capabilities.screenResolutionY;
		}
		
		public function updateTime():void {
			prevTickTime = thisTickTime;
			thisTickTime = new Date().time;
		}
		
		public function get tickTime():Number {
			return thisTickTime - prevTickTime;
		}
		
	}

}