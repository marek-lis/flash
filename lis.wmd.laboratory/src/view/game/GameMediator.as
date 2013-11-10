package view.game 
{
	import model.AssetFactoryProxy;
	import model.GameProxy;
	import org.mvcexpress.mvc.Mediator;
	import starling.core.Starling;
	import starling.events.Event;
	import view.game.stage.StageGame;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameMediator extends Mediator 
	{
		
		[Inject]
		public var view:Game;
		
		[Inject]
		public var gameProxy:GameProxy;
		
		[Inject]
		public var assetFactoryProxy:AssetFactoryProxy;
		
		private var _gameView:StageGame;
		
		override public function onRegister():void 
		{
			trace(this + " onRegister");
			Starling.multitouchEnabled = false;
			Starling.handleLostContext = false;
			view.addEventListener("activate", onActivateHandler);
			view.addEventListener("deactivate", onDeactivateHandler);
			var s:Starling = new Starling(StageGame, view.stage);
			s.start();
			s.addEventListener(Event.ROOT_CREATED, function(e:Event, game:StageGame):void {
				gameProxy.screenWidth = view.stage.stageWidth;
				gameProxy.screenHeight = view.stage.stageHeight;
				assetFactoryProxy.init();
				_gameView = game;
				mediatorMap.mediate(_gameView);
			});
		}
		
		override public function onRemove():void 
		{
			trace(this + " onRemove");
			view.removeEventListener("activate", onActivateHandler);
			view.removeEventListener("deactivate", onDeactivateHandler);
			mediatorMap.unmediate(_gameView);
		}
		
		private function onActivateHandler(e:Object):void 
		{
			//trace(this + " onActivateHandler ");
			gameProxy.updateTime();
			gameProxy.active = true;
		}
		
		private function onDeactivateHandler(e:Object):void 
		{
			//trace(this + " onDeactivateHandler ");
			gameProxy.active = false;
		}
		
	}

}