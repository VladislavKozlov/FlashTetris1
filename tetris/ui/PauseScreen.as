package tetris.ui 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import tetris.visual.UIButton;
	import tetris.Assets;
	
	/**
	 *
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class PauseScreen extends WindowBase 
	{
		public var buttonPause:UIButton;
		public var buttonPlay:UIButton;
		public var buttonQuit:UIButton;
		
		public function PauseScreen() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
		}
		
		private function onAdddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
			 
			var pauseScreenContainer:WindowBase = new WindowBase();
			addChild(pauseScreenContainer);
			
			var background:Bitmap = new Bitmap();
			background = Assets.backgroundGeneral;
			background.smoothing = true;
			background.alpha = 0.1;
			pauseScreenContainer.addChild(background);
			
			background.x = (pauseScreenContainer.width - background.width) / 2;
			background.y = (pauseScreenContainer.height - background.height) / 2;
			
			var tetrisBackground:Bitmap = new Bitmap();
			tetrisBackground = Assets.backgroundPause;
			tetrisBackground.smoothing = true;
			pauseScreenContainer.addChild(tetrisBackground);
			
			tetrisBackground.x = (background.width - tetrisBackground.width) / 2;
			tetrisBackground.y = (background.height - tetrisBackground.height) / 2;
			
			var gameLogo:Bitmap = new Bitmap();
			gameLogo = Assets.logoBitmap;
			gameLogo.x = tetrisBackground.x + 200;
			gameLogo.y = tetrisBackground.y + 349;
			pauseScreenContainer.addChild(gameLogo);
			
			var backgroundButton:Bitmap = new Bitmap();
			backgroundButton = Assets.backgroundButton;
			backgroundButton.x = tetrisBackground.x + 200;
			backgroundButton.y = tetrisBackground.y + 200;
			backgroundButton.smoothing = true;
			pauseScreenContainer.addChild(backgroundButton);
			
			var buttonPauseBp:Bitmap = new Bitmap();
			buttonPauseBp = Assets.buttonPause;
			
			buttonPause = new UIButton(null, buttonPauseBp);
			buttonPause.x = tetrisBackground.x + 220;
			buttonPause.y = tetrisBackground.y + 250;
			pauseScreenContainer.addChild(buttonPause);
			
		}
	}
}