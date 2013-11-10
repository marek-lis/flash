package view.main
{
import Main;
import org.mvcexpress.mvc.Mediator;
import view.game.Game;

/**
 * Mediator for aplication root view object.
 * @author Marek Lis
 */
public class MainMediator extends Mediator 
{
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	private var gameView:Game;
	
	override public function onRegister():void 
	{
		trace(this + " onRegister");
		gameView = new Game();
		view.addChild(gameView);
		mediatorMap.mediate(gameView);
	}
	
	override public function onRemove():void 
	{
		trace(this + " onRemove");
		mediatorMap.unmediate(gameView);
		view.removeChild(gameView);
	}
	
}
}