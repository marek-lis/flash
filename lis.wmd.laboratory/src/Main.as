package 
{
import flash.display.Sprite;
import flash.events.Event;

/**
 * TODO:CLASS COMMENT
 * @author Marek Lis
 */

[Frame(factoryClass="Preloader")]
public class Main extends Sprite 
{

	private var module:MainModule;
	
	public function Main():void 
	{
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(event:Event = null):void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		module = new MainModule();
		module.start(this);
	}
}
}