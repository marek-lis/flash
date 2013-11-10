package 
{
import org.mvcexpress.core.ModuleCore;
import org.mvcexpress.utils.checkClassStringConstants;
import controler.setup.SetupControlerCommand;
import controler.setup.SetupModelCommand;
import controler.setup.SetupViewCommand;
import messages.DataMsg;
import messages.Msg;
import messages.ViewMsg;
	
/**
 * TODO:CLASS COMMENT
 * @author Marek Lis
 */
public class MainModule extends ModuleCore 
{
	
	override protected function onInit():void 
	{
		
		// little utility to prevent accidental message constant dublications.
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}
		
		// map commands
		commandMap.execute(SetupControlerCommand);
		// map proxies (and services)
		commandMap.execute(SetupModelCommand);
		// map mediators
		commandMap.execute(SetupViewCommand);
		
	}
	
    public function start(main:Main):void 
    {
        trace("Hello mvcExpress!!!");
		// mediate main view.
		mediatorMap.mediate(main);
    }	
	
}
}