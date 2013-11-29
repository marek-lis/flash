package model 
{
	import flash.geom.Rectangle;
	import messages.DataMsg;
	import org.mvcexpress.mvc.Proxy;
	import starling.core.Starling;
	import view.game.IGameItem;
	import view.game.stage.StageGameItem;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameBoardProxy extends Proxy 
	{
		
		[Inject]
		public var gameProxy:GameProxy;
		
		public var items:Vector.<IGameItem>;
		
		public var itemId:int = 0;
		
		public function GameBoardProxy() 
		{
			items = new Vector.<IGameItem>();
		}
		
		public function addItem(item:GameItemVO):void {
			item.id = itemId++;
			items.push(new StageGameItem(item));
			trace("ADD ITEM " + item.id);
			sendMessage(DataMsg.ADD_ITEM, items[items.length - 1]);
		}
		
		public function getItemById(id:int):IGameItem {
			var i:int = 0;
			var len:int = items.length;
			var result:IGameItem = null;
			for (i = 0; i < len; i++) {
				if (items[i].getVO().id == id) {
					result = items[i];
					break;
				}
			}
			return result;
		}
		
		public function getItemByPos(x:int, y:int):IGameItem {
			var i:int = 0;
			var len:int = items.length;
			var result:IGameItem = null;
			for (i = 0; i < len; i++) {
				if (items[i].isHit(x,y)) {
					result = items[i];
					break;
				}
			}
			return result;
		}
		
		public function hasItemNearby(x:int, y:int):Boolean {
			var i:int = 0;
			var len:int = items.length;
			var result:Boolean = false;
			for (i = 0; i < len; i++) {
				if (items[i].isNearby(x,y)) {
					result = true;
					break;
				}
			}
			return result;
		}
		
		public function isOutOfBounds(x:int, y:int):Boolean {
			return x < 25 || x > gameProxy.screenWidth - 25 || y < 25 || y > gameProxy.screenHeight - 25;
		}
		
		public function removeItem(id:int):void {
			var i:int;
			var len:int = items.length;
			var item:IGameItem;
			for (i = 0; i < len; i++) {
				if (items[i].getVO().id == id) {
					item = items.splice(i, 1)[0];
					sendMessage(DataMsg.REMOVE_ITEM, item);
					break;
				}
			}
		}
		
		public function updateItems(tt:Number):void {
			var i:int;
			var j:int;
			var len:int = items.length;
			var bounds:Rectangle = new Rectangle(0, 0,Starling.current.stage.stageWidth,Starling.current.stage.stageHeight);
			for (i = 0; i < len; i++) {
				items[i].updateMe(tt);
			}
			for (i = 0; i < len; i++) {
				if (items[i].isCollidingWithBounds(bounds)) {
					items[i].bounceMe();
				} else
				for (j = i + 1; j < len; j++) {
					if (items[i].isCollidingWith(items[j])) {
						items[i].bounceMe();
						items[j].bounceMe();
						//sendMessage(DataMsg.BOUNCE_ITEM, { ratio1: items[i].getVO().radius / items[i].getVO().radiusMax, ratio2: items[j].getVO().radius / items[j].getVO().radiusMax } );
						sendMessage(DataMsg.BOUNCE_ITEM, { bouncePoint: items[i].getVO().getBouncePoint(items[j].getVO()), item1: items[i], ratio1: 1 - Math.min(25 / items[i].getVO().radius, 1), item2: items[j], ratio2: 1 - Math.min(25 / items[j].getVO().radius, 1) } );
					}
				}
			}
		}
		
	}

}