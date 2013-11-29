package model 
{
	import org.mvcexpress.mvc.Proxy;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class AssetFactoryProxy extends Proxy
	{
		
		[Embed(source="../../assets/logo512.png")]
		private var Icon:Class;
		
		[Embed(source = "../../assets/bounce.pex", mimeType = "application/octet-stream")]
		private var BounceConfig:Class;
		
		[Embed(source = "../../assets/bounce.png")]
		private var BounceParticle:Class;
		
		
		public var texture:Texture;
		
		public function init():void {
			texture = Texture.fromBitmap(new Icon(), true, true, 1);
		}
		
		public function getTexture():Texture {
			return texture;
		}
		
		public function getParticle():PDParticleSystem {
			return new PDParticleSystem(new XML(new BounceConfig()), Texture.fromBitmap(new BounceParticle()));
		}
		
	}

}