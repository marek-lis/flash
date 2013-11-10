package controler.game 
{
	import model.GameBoardProxy;
	import model.GameProxy;
	import org.mvcexpress.mvc.Command;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameTickCommand extends Command 
	{
		
		[Inject]
		public var gameProxy:GameProxy;
		
		[Inject]
		public var gameBoardProxy:GameBoardProxy;
		
		public function execute(o:Object):void {
			//trace(this + " tick " + o);
			gameProxy.updateTime();
			gameBoardProxy.updateItems(gameProxy.tickTime);
		}
		
	}

}