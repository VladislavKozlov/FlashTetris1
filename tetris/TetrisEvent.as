package tetris 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class TetrisEvent extends Event 
	{
		public static const GAME_PLAY                   :String = "GAME_PLAY";
		public static const GAME_PAUSE                  :String = "GAME_PAUSE";
		public static const GAME_EXIT                   :String = "GAME_EXIT";
		public static const GAME_OVER                   :String = "GAME_OVER";
		
		public static const BUTTON_DOWN               	:String = "BUTTON_DOWN";
		public static const FIGURE_ROTATE               :String = "FIGURE_ROTATE";
		public static const FIGURE_REFLECT_IN_FIELD     :String = "FIGURE_REFLECT_IN_FIELD";
		public static const REMOVE_FILLED_LINES         :String = "REMOVE_FILLED_LINES";
		
		
		private static var _dispatcher:EventDispatcher;
		
		
		public static function get dispatcher():EventDispatcher
		{
			if (_dispatcher == null)
				_dispatcher = new EventDispatcher();
				
			return _dispatcher;
		}
		
		public static function dispatch( type:String, someData:*):void
		{
			dispatcher.dispatchEvent( new TetrisEvent(type, someData ) );
		}
		
		public function TetrisEvent(type:String, obj:*=null) 
		{
			super(type, false, obj);
		}
	}
}