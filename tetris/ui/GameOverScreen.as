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
	public class GameOverScreen extends WindowBase 
	{
		public var buttonPlay:UIButton;
		public var buttonQuit:UIButton;
		public var buttonPause:UIButton;
		
		public function GameOverScreen() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
		}
		
		private function onAdddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
			 
			var gameOverScreenContainer:WindowBase = new WindowBase();
			addChild(gameOverScreenContainer);
			
			var background:Bitmap = new Bitmap();
			background = Assets.backgroundGeneral;
			background.smoothing = true;
			background.alpha = 0.1;
			gameOverScreenContainer.addChild(background);
			
			background.x = (gameOverScreenContainer.width - background.width) / 2;
			background.y = (gameOverScreenContainer.height - background.height) / 2;
			
			var tetrisBackground:Bitmap = new Bitmap();
			tetrisBackground = Assets.backgroundGameOver;
			tetrisBackground.smoothing = true;
			tetrisBackground.alpha = 0.5;
			gameOverScreenContainer.addChild(tetrisBackground);
			
			tetrisBackground.x = (background.width - tetrisBackground.width) / 2;
			tetrisBackground.y = (background.height - tetrisBackground.height) / 2;
			
			var gameLogo:Bitmap = new Bitmap();
			gameLogo = Assets.logoBitmap;
			gameLogo.x = tetrisBackground.x + 200;
			gameLogo.y = tetrisBackground.y + 349;
			gameOverScreenContainer.addChild(gameLogo);
			
			var backgroundButton:Bitmap = new Bitmap();
			backgroundButton = Assets.backgroundButton;
			backgroundButton.x = tetrisBackground.x + 200;
			backgroundButton.y = tetrisBackground.y + 200;
			backgroundButton.smoothing = true;
			gameOverScreenContainer.addChild(backgroundButton);
			
			var buttonPlayBp:Bitmap = new Bitmap();
			buttonPlayBp = Assets.buttonPlay;
			
			buttonPlay = new UIButton(null, buttonPlayBp);
			buttonPlay.x = tetrisBackground.x + 220;
			buttonPlay.y = tetrisBackground.y + 250;
			gameOverScreenContainer.addChild(buttonPlay);
			
			var buttonQuitBp:Bitmap = new Bitmap();
			buttonQuitBp = Assets.buttonQuit;
			
			buttonQuit = new UIButton(null, buttonQuitBp);
			buttonQuit.x = tetrisBackground.x + 220;
			buttonQuit.y = tetrisBackground.y + 300;
			gameOverScreenContainer.addChild(buttonQuit);
			
		}
	}
}