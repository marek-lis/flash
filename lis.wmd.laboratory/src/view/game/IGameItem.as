package view.game 
{
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
		function getVO():GameItemVO;
		function isHit(x:int, y:int):Boolean;
		function isNearby(x:int, y:int):Boolean;
		function isCollidingWith(item:IGameItem):Boolean;
	}
	
}