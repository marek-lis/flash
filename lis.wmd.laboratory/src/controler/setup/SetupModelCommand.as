package controler.setup
{
import model.AssetFactoryProxy;
import model.GameBoardProxy;
import model.GameProxy;
import model.SynthProxy;
import org.mvcexpress.mvc.Command;
	
/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author Marek Lis
 */
public class SetupModelCommand extends Command 
{
	
	public function execute(params:Object):void 
	{
		proxyMap.mapObject( new AssetFactoryProxy() );
		proxyMap.mapObject( new GameProxy() );
		proxyMap.mapObject( new GameBoardProxy() );
		proxyMap.mapObject( new SynthProxy() );
	}
	
}
}