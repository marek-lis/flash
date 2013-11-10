package controler.setup
{
import org.mvcexpress.mvc.Command;
import view.game.Game;
import view.game.GameMediator;
import view.game.stage.StageGame;
import view.game.stage.StageGameMediator;
import view.main.MainMediator;
	
/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author Marek Lis
 */
public class SetupViewCommand extends Command 
{
	
	public function execute(params:Object):void 
	{
		mediatorMap.map(Main, MainMediator);
		mediatorMap.map(Game, GameMediator);
		mediatorMap.map(StageGame, StageGameMediator);
	}
	
}
}