package tetris.ui
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import tetris.visual.UIButton;
	import tetris.Assets;	
	
	/**
	 *
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class GameScreenStatic extends WindowBase 
	{
		public var scoreTextField:TextField;
		public var linesTextField:TextField;
		public var levelTextField:TextField;
		public var buttonPlay:UIButton;
		public var buttonQuit:UIButton;
		public var buttonPause:UIButton;
		
		public function GameScreenStatic() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
		}
		
		private function onAdddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
			 
			var gameScreenStaticContainer:WindowBase = new WindowBase();
			addChild(gameScreenStaticContainer);
			
			var background:Bitmap = new Bitmap();
			background = Assets.backgroundGeneral;
			background.smoothing = true;
			gameScreenStaticContainer.addChild(background);
			
			background.x = (gameScreenStaticContainer.width - background.width) / 2;
			background.y = (gameScreenStaticContainer.height - background.height) / 2;
			
			var tetrisBackground:Bitmap = new Bitmap();
			tetrisBackground = Assets.backgroundTetris;
			tetrisBackground.smoothing = true;
			gameScreenStaticContainer.addChild(tetrisBackground);
			
			tetrisBackground.x = (background.width - tetrisBackground.width) / 2;
			tetrisBackground.y = (background.height - tetrisBackground.height) / 2;
			
			levelTextField = createTextField(tetrisBackground.x + 220, tetrisBackground.y + 120, TextFieldAutoSize.LEFT, TextFormatAlign.LEFT);
			levelTextField.text = "Level: 1";
			linesTextField = createTextField(tetrisBackground.x + 220, tetrisBackground.y + 150, TextFieldAutoSize.LEFT, TextFormatAlign.LEFT);
			linesTextField.text = "Lines: 0";
			scoreTextField = createTextField(tetrisBackground.x + 220, tetrisBackground.y + 180, TextFieldAutoSize.LEFT, TextFormatAlign.LEFT);
			scoreTextField.text = "Score: 0";
			
			var gameLogo:Bitmap = new Bitmap();
			gameLogo = Assets.logoBitmap;
			gameLogo.x = tetrisBackground.x + 200;
			gameLogo.y = tetrisBackground.y + 349;
			gameScreenStaticContainer.addChild(gameLogo);
			
			var buttonPlayBp:Bitmap = new Bitmap();
			buttonPlayBp = Assets.buttonPlay;
			
			buttonPlay = new UIButton(null, buttonPlayBp);
			buttonPlay.x = tetrisBackground.x + 220;
			buttonPlay.y = tetrisBackground.y + 250;
			gameScreenStaticContainer.addChild(buttonPlay);
			
			var buttonQuitBp:Bitmap = new Bitmap();
			buttonQuitBp = Assets.buttonQuit;
			
			buttonQuit = new UIButton(null, buttonQuitBp);
			buttonQuit.x = tetrisBackground.x + 220;
			buttonQuit.y = tetrisBackground.y + 300;
			gameScreenStaticContainer.addChild(buttonQuit);
		}
		
		private function createTextField(x:int, y:int, autoSize:String, align:String):TextField
		{
			var tf:TextField = new TextField();
			tf.type = TextFieldType.DYNAMIC;
			tf.selectable = false;
			tf.x = x;
			tf.y = y;
			tf.autoSize = autoSize;
			
			var format:TextFormat = tf.defaultTextFormat;
			format.align = align;
			format.size = 16;
			format.bold = true;
			format.color = 0x000000;
			tf.defaultTextFormat = format;
			addChild(tf);
			
			return tf;
		}
	}
}