package model 
{
	import flash.geom.Point;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class GameItemVO 
	{
		
		public var x:int;
		public var y:int;
		public var id:int;
		public var radius:int;
		public var radiusMin:int;
		public var radiusMax:int;
		public var direction:int;
		public var effect:Number;
		public var texture:Texture;
		
		public function GameItemVO() 
		{
			id = -1;
			radiusMin = 25;
			radiusMax = 512;//1024;
			direction = 1;
			effect = 0;
			radius = 1;
		}
		
		public function getBouncePoint(item:GameItemVO):Point {
			var angle:Number = Math.atan2(item.x - x, item.y - y);
			var xx:int = size * Math.sin(angle);
			var yy:int = size * Math.cos(angle);
			return new Point(x + xx, y + yy);
		}
		
		public function get ratio():Number {
			return (radius - radiusMin) / (radiusMax - radiusMin);
		}
		
		public function get antiratio():Number {
			return 1 - ratio;
		}
		
		public function get scale():Number {
			return 2 * radius / radiusMax;
		}
		
		public function get size():int {
			return scale * radiusMax / 2;
		}
		
	}

}