package view.game 
{
	import flash.geom.Rectangle;
	import model.GameItemVO;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public interface IGameItem 
	{
		function showMe(onComplete:Function = null):void;
		function hideMe(onComplete:Function = null):void;
		function updateMe(tt:Number):void;
		function bounceMe():void;
		function setColor(color:Number):void;
		function getVO():GameItemVO;
		function isHit(x:int, y:int):Boolean;
		function isNearby(x:int, y:int):Boolean;
		function isCollidingWith(item:IGameItem):Boolean;
		function isCollidingWithBounds(bounds:Rectangle):Boolean;
	}
	
}