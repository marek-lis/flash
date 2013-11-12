package view.game.stage
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Expo;
	import com.greensock.TweenMax;
	import model.GameItemVO;
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.filters.BlurFilter;
	import starling.filters.ColorMatrixFilter;
	import starling.filters.FragmentFilter;
	import starling.filters.FragmentFilterMode;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	import view.game.IGameItem;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class StageGameItem extends Sprite implements IGameItem
	{
		
		private var _image:Image;
		
		private var _vo:GameItemVO;
		
		public function StageGameItem(vo:GameItemVO)
		{
			_vo = vo;
			_image = new Image(_vo.texture);
			//_image.smoothing = TextureSmoothing.TRILINEAR;
			addChild(_image);
			alpha = 0;
			touchable = false;
			pivotX = width / 2;
			pivotY = height / 2;
			blendMode = BlendMode.ADD;
			x = _vo.x;
			y = _vo.y;
//			filter = BlurFilter.createGlow(0xFFFFFF, 0.5, 5.0, 0.5);
		}
		
		public function get radius():int
		{
			return _vo.radius;
		}
		
		public function set radius(value:int):void
		{
			_vo.radius = value < 1 ? 1 : (value > _vo.radiusMax ? _vo.radiusMax : value);
		}
		
		public function getVO():GameItemVO
		{
			return _vo;
		}
		
		public function showMe(onComplete:Function = null):void
		{
			TweenMax.to(this, 0.25, { alpha: 1, ease:Expo.easeIn, onComplete: onComplete } );
		}
		
		public function hideMe(onComplete:Function = null):void
		{
			TweenMax.to(this, 0.25, { alpha: 0, scaleX: 0, scaleY: 0, ease: Back.easeIn, onComplete: onComplete } );
		}
		
		public function updateMe(tt:Number):void
		{
			//trace(tt);
			if (_vo.direction == 1)
			{
				if (_vo.radius < _vo.radiusMax)
				{
					_vo.radius++;
				}
				else
				{
					_vo.direction = -1;
				}
			}
			else if (_vo.direction == -1)
			{
				if (_vo.radius > _vo.radiusMin)
				{
					_vo.radius--;
				}
				else
				{
					_vo.direction = 1;
				}
			}
			//rotation += 5 * (Math.PI / 180);
			rotation += _vo.direction * 0.25 * tt * (Math.PI / 180);
			//width = height = 2 * _vo.radius;
			scaleX = scaleY = _vo.scale;
			//trace(_vo.x + " " + _vo.y + " " + (_vo.radius / _vo.radiusMax));
			//alpha = 0.5 + 0.5 * _vo.radius / _vo.radiusMax;
			//trace("tick " + rotation + " " + width + " " + height);
			//trace(scaleX + " " + scaleY);
		}
		
		public function bounceMe():void
		{
			if (_vo.direction == 1)
			{
				_vo.direction = -1;
			}
		}
		
		public function isHit(x:int, y:int):Boolean
		{
			return Math.sqrt(Math.pow((_vo.x - x), 2) + Math.pow((_vo.y - y), 2)) < _vo.size;
		}
		
		public function isNearby(x:int, y:int):Boolean
		{
			return Math.sqrt(Math.pow((_vo.x - x), 2) + Math.pow((_vo.y - y), 2)) < Math.max(_vo.size + _vo.radiusMin, 2 * _vo.radiusMin);
		}
		
		public function isCollidingWith(item:IGameItem):Boolean
		{
			return Math.sqrt(Math.pow((_vo.x - item.getVO().x), 2) + Math.pow((_vo.y - item.getVO().y), 2)) < _vo.size + item.getVO().size; //_vo.radius + item.getVO().radius;
		}
	
	}

}