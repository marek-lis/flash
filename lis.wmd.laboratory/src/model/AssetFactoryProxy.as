package model 
{
	import org.mvcexpress.mvc.Proxy;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class AssetFactoryProxy extends Proxy
	{
		
		[Embed(source="../../assets/logo1024.png")]
		public var icon:Class;
		
		public var texture:Texture;
		
		public function init():void {
			texture = Texture.fromBitmap(new icon(), true, true, 1);
		}
		
		public function getTexture():Texture {
			return texture;
		}
		
	}

}