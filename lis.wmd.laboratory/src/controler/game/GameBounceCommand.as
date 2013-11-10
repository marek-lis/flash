package controler.game 
{
	import model.SynthProxy;
	import org.mvcexpress.mvc.Command;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameBounceCommand extends Command 
	{
		
		[Inject]
		public var synthProxy:SynthProxy;
		
		public function execute(o:Object):void {
			synthProxy.playNote(o.radius1);
			synthProxy.playNote(o.radius2);
		}
		
	}

}