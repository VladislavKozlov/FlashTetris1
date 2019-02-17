package tetris.ui 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import tetris.visual.UIButton;
	import tetris.Assets;
	
	/**
	 *
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class MainMenu extends WindowBase 
	{
		public var buttonPlay:UIButton;
		public var buttonQuit:UIButton;
		public var buttonPause:UIButton;
		
		public function MainMenu() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
		}
		
		private function onAdddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdddedToStage);
			
			var mainMenuContainer:WindowBase = new WindowBase();
			addChild(mainMenuContainer);
			
			var background:Bitmap = new Bitmap();
			background = Assets.backgroundBitmap;
			background.smoothing = true;
			mainMenuContainer.addChild(background);
			
			var buttonsContainer:WindowBase = new WindowBase();
			mainMenuContainer.addChild(buttonsContainer);
			
			buttonPlay = new UIButton("ENTRY");
			buttonsContainer.addChild(buttonPlay);
			
			buttonsContainer.x = (mainMenuContainer.width - buttonsContainer.width) / 2;
			buttonsContainer.y = (mainMenuContainer.height - buttonsContainer.height) / 2 + mainMenuContainer.width / 6;
		}
	}
}