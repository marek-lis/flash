package controler.game 
{
	import model.AssetFactoryProxy;
	import model.GameBoardProxy;
	import model.GameItemVO;
	import model.GameProxy;
	import org.mvcexpress.mvc.Command;
	import starling.textures.Texture;
	import view.game.IGameItem;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameClickCommand extends Command 
	{
		
		[Inject]
		public var assetFactoryProxy:AssetFactoryProxy;
		
		[Inject]
		public var gameProxy:GameProxy;
		
		[Inject]
		public var gameBoardProxy:GameBoardProxy;
		
		public function execute(o:Object):void {
			trace(this + " GameClickCommand " + o.x + " " + o.y + " " + gameBoardProxy);
			var item:IGameItem = gameBoardProxy.getItemByPos(o.x, o.y);
			trace("ITEM: " + item);
			if (item) {
				gameBoardProxy.removeItem(item.getVO().id);
			} else 
			if (!gameBoardProxy.hasItemNearby(o.x, o.y) && !gameBoardProxy.isOutOfBounds(o.x, o.y)){
				var vo:GameItemVO = new GameItemVO();
				vo.x = o.x;
				vo.y = o.y;
				vo.texture = assetFactoryProxy.getTexture();
				gameBoardProxy.addItem(vo);
			}
		}
		
	}

}