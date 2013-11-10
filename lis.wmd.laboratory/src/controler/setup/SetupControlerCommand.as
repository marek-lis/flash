package controler.setup
{
import controler.game.GameClickCommand;
import controler.game.GameTickCommand;
import messages.ViewMsg;
import org.mvcexpress.mvc.Command;
	
/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author Marek Lis 
 */
public class SetupControlerCommand extends Command 
{
	
	public function execute(params:Object):void 
	{
		commandMap.map(ViewMsg.TICK, GameTickCommand);
		commandMap.map(ViewMsg.CLICK, GameClickCommand);
	}
	
}
}