package tetris.visual 
{
	import flash.events.TouchEvent;
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import tetris.Assets;
	
	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class UIButton extends Sprite 
	{
		public var text:String;
		private var _buttonImage:Bitmap;
		
		public function UIButton(text:String = null, button:Bitmap = null) 
		{			
			this.text = text;
			_buttonImage = button;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{			
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (!_buttonImage)
			{
				_buttonImage = new Bitmap();
				_buttonImage = Assets.buttonBitmap;
				_buttonImage.smoothing = true;
				addChild(_buttonImage);
			}
			else
			{
				_buttonImage.smoothing = true;
				addChild(_buttonImage);
			}			
			if (text)
			{
				var textField:TextField = generateTextField(30, text); 
				textField.x = (_buttonImage.width - textField.width) / 2;
				textField.y = (_buttonImage.height - textField.height) / 2;
				addChild(textField);
			}
			
			this.addEventListener(MouseEvent.MOUSE_OVER, touchBegin); 
		}
		
		public static function generateTextField(size:uint, text:String = "", color:uint = 0x000000):TextField 
		{
			var textFormat:TextFormat = new TextFormat();
			textFormat.color = color;
			textFormat.size = size;
			
			var textField:TextField = new TextField();
			textField.selectable = false;
			textField.defaultTextFormat = textFormat;
			textField.text = text;
			textField.width = textField.textWidth + 4;
			textField.height = textField.textHeight + 4;
			
			return textField;
		}
		
		private function touchBegin(e:MouseEvent):void 
		{
			TweenLite.to(_buttonImage, 0.3, { alpha:0.1 } );
			stage.addEventListener(MouseEvent.MOUSE_OVER, touchEnd);
		}
		
		private function touchEnd(e:MouseEvent):void 
		{
			TweenLite.to(_buttonImage, 0.3, { alpha:1 } );
			stage.removeEventListener(MouseEvent.MOUSE_OVER, touchEnd);
		}
	}
}