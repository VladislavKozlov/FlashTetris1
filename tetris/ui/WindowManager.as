package tetris.ui 
{
	import flash.utils.Dictionary;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class WindowManager 
	{ 
		private static var _windows:Object = 
		{
			"mainMenuWindow"			: MainMenu,
			"pauseScreenWindow"			: PauseScreen,
			"gameScreenStaticWindow"	: GameScreenStatic,
			"gameScreenWindow"			: GameScreen,
			"gameOverScreenWindow"		: GameOverScreen
		}
		
		private static var _winDict:Dictionary = new Dictionary();
		private static var _mainCont:DisplayObjectContainer;
		
		public static function init(mainCont:DisplayObjectContainer):void
		{
			_mainCont = mainCont;
		}
		
		public static function showWindow( winName:String, args:* = null):void
		{
			var cWindow:WindowBase ;
			if (!_winDict.hasOwnProperty(winName))
			{
				var cClass:Class = _windows[winName];
				cWindow = new cClass();
				_winDict[winName] = cWindow;
			}
			
			cWindow = _winDict[winName];
			cWindow.initWithData(args);
			_mainCont.addChild(cWindow);
			placeBackground(_mainCont);
			cWindow.show();
			cWindow.layout(_mainCont.stage.stageWidth, _mainCont.stage.stageHeight);
		}
	
		static public function hideWindow(winName:String):void 
		{
			var win:WindowBase = _winDict[winName];
			if (win && win.stage)
				win.removeFromParent();
		}
		
		private function placeBackground(scaledObject:DisplayObject):void 
		{
			scaledObject.scaleX = scaledObject.scaleY = 1;
			var scale:Number;
			if (scaledObject.width / scaledObject.height > stage.stageWidth / stage.stageHeight)
			{
				scale = stage.stageHeight / scaledObject.height;
			}
			else 
			{
				scale = stage.stageWidth / scaledObject.width;
			}
			scaledObject.scaleX = scaledObject.scaleY = scale;
			scaledObject.x = (stage.stageWidth - scaledObject.width) / 2;
			scaledObject.y = (stage.stageHeight - scaledObject.height) / 2;
		}	
	}
}