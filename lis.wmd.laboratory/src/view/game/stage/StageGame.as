package view.game.stage 
{
	import flash.utils.setTimeout;
	import messages.ViewMsg;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class StageGame extends Sprite 
	{
		
		public var background:Image;
		
		public function StageGame() 
		{
		}
		
		public function init(width:int, height:int):void {
			stage.touchable = true;
			background = new Image(Texture.fromColor(width, height, 0x000000));
			addChild(background);
		}
		
		public function start():void {
			trace("START");
			stage.alpha = 0;
			setTimeout(function():void {
				stage.alpha = 1;
				stage.addEventListener(Event.ENTER_FRAME, onFrameHandler);
				stage.addEventListener(TouchEvent.TOUCH, onTouchHandler);
			}, 1000);
		}
		
		public function stop():void {
			trace("STOP");
			stage.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
			stage.removeEventListener(TouchEvent.TOUCH, onTouchHandler);
		}
		
		private function onFrameHandler(e:Event):void {
			//trace(this + " onFrameHandler ");
			dispatchEventWith(ViewMsg.TICK);
		}
		
		private function onTriggerHandler(e:Event):void 
		{
			//trace(this + " onTriggerHandler ");
//			dispatchEventWith(ViewMsg.CLICK);
		}
		
		private function onTouchHandler(e:TouchEvent):void 
		{
			var t:Touch = e.touches[e.touches.length - 1];
			if (t && t.phase == TouchPhase.BEGAN) {
				trace(this + " onTouchHandler " + t.phase + " " + t.globalX + " " + t.globalY);
				dispatchEventWith(ViewMsg.CLICK, false, {x:t.globalX, y:t.globalY});
			}
		}
		
	}

}