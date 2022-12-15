package 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import sound.Sfx;
	import tetris.logic.GameLogic;
	import tetris.Assets;
	import tetris.ui.MainMenu;
	import tetris.ui.GameScreen;
	import tetris.ui.GameOverScreen;
	import tetris.ui.PauseScreen;
	import tetris.ui.WindowManager;
	import tetris.ui.GameScreenStatic;
	import tetris.TetrisEvent;	
	
	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class Game extends Sprite   
	{
		private static const SCORE_MULT:Vector.<int> = Vector.<int>([10, 100, 220, 380, 500]);	
		private static const SPEED_START:int = 900;
		private static const SPEED_MULT:Number = 0.8;
		
		private var _tetris:GameLogic;
		private var _timer:Timer;
		private var _score:int; 
		private var _lines:int;
		private var _level:int;
		private var _pause:Boolean = false;
		private var _gameOver:Boolean = false;
		
		public static var gameCont:DisplayObjectContainer;
		
		public var soundGameOverSfx:Sfx;
		public var soundRotateSfx:Sfx;
		public var soundReflectSfx:Sfx;
		public var soundRemoveLinesSfx:Sfx;
		public var soundButtonDownSfx:Sfx;
		
		private var _menuScreen:MainMenu;
		private var _gameScreen:GameScreen;
		private var _gameOverScreen:GameOverScreen;
		private var _pauseScreen:PauseScreen;
		private var _gameScreenStatic:GameScreenStatic;
				
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			soundRotateSfx = new Sfx(Assets.soundRotate);
			soundReflectSfx = new Sfx(Assets.soundReflect);
			soundRemoveLinesSfx = new Sfx(Assets.soundRemove);
			soundGameOverSfx = new Sfx(Assets.soundGameOver);
			soundButtonDownSfx = new Sfx(Assets.soundButtonDown);
			
			showMenu(); 
		}
		
		private function showMenu():void 
		{
			_menuScreen = new MainMenu();
			addChild(_menuScreen);
			placeBackground(_menuScreen);
			_menuScreen.buttonPlay.addEventListener(MouseEvent.CLICK, onShowGameScreen);
		}
		
		private function onShowGameScreen(e:Event):void 
		{
			soundButtonDownSfx.play();
			_menuScreen.buttonPlay.removeEventListener(MouseEvent.CLICK, onShowGameScreen);
			removeChild(_menuScreen);
			_gameScreenStatic = new GameScreenStatic();
			addChild(_gameScreenStatic);
			placeBackground(_gameScreenStatic);
			_gameScreenStatic.buttonPlay.addEventListener(MouseEvent.CLICK, onGameStart);
			_gameScreenStatic.buttonQuit.addEventListener(MouseEvent.CLICK, onQuitGameScreenStatic);
			_pauseScreen = new PauseScreen();
			_gameOverScreen = new GameOverScreen();
		}
		
		private function onGameStart(e:Event):void
		{
			soundButtonDownSfx.play();
			if (_gameOver)
			{
				removeChild(_gameScreen);
			}
			else
			{
				_gameScreenStatic.buttonPlay.removeEventListener(MouseEvent.CLICK, onGameStart);
				removeChild(_gameScreenStatic);
			}
			
			_gameScreen = new GameScreen();			
			_tetris = new GameLogic(10, 20, 20, 4, _gameScreen.tetrisContainer);
			_timer = new Timer(SPEED_START);
			addChild(_gameScreen);
			placeBackground(_gameScreen);
			startPlaying();	
		}
		
		private function onGotoPause(e:Event):void
		{
			soundButtonDownSfx.play();
			_gameScreen.buttonPause.removeEventListener(MouseEvent.CLICK, onGotoPause);
			stopPlaying();
			_pause = true;
			addChild(_pauseScreen);
			placeBackground(_pauseScreen);
			_pauseScreen.buttonPause.addEventListener(MouseEvent.CLICK, onGotoAnPause);
		}
		
		private function onGotoAnPause(e:Event):void
		{
			soundButtonDownSfx.play();
			_pauseScreen.buttonPause.removeEventListener(MouseEvent.CLICK, onGotoAnPause);
			removeChild(_pauseScreen);
			startPlaying();
			_pause = false;
		}
		
		private function onQuitGameScreenStatic(e:Event):void 
		{
			soundButtonDownSfx.play();
			_gameScreenStatic.buttonQuit.removeEventListener(MouseEvent.CLICK, onQuitGameScreenStatic);
			removeChild(_gameScreenStatic);
			addChild(_menuScreen);
			placeBackground(_menuScreen);
			_menuScreen.buttonPlay.addEventListener(MouseEvent.CLICK, onShowGameScreen);
		}
		
		private function onQuitGameOverScreen(e:Event):void 
		{
			soundButtonDownSfx.play();
			_gameOverScreen.buttonQuit.removeEventListener(MouseEvent.CLICK, onQuitGameOverScreen);
			removeChild(_gameScreen);
			removeChild(_gameOverScreen);
			_gameOver = false;
			addChild(_menuScreen);
			placeBackground(_menuScreen);
			_menuScreen.buttonPlay.addEventListener(MouseEvent.CLICK, onShowGameScreen);
		}
		
		private function onQuitGameScreen(e:Event):void 
		{
			soundButtonDownSfx.play();
			_gameScreen.buttonQuit.removeEventListener(MouseEvent.CLICK, onQuitGameScreen);
			stopPlaying();
			_gameOver = true;
			soundGameOverSfx.play();
			addChild(_gameOverScreen);
			placeBackground(_gameOverScreen);
			_gameOverScreen.buttonQuit.addEventListener(MouseEvent.CLICK, onQuitGameOverScreen);
			_gameOverScreen.buttonPlay.addEventListener(MouseEvent.CLICK, onGameStart);
		}
		
		private function startPlaying():void
		{
			if (_gameOver)
			{
				_gameOver = false;
				removeChild(_gameOverScreen);
			}
			_gameScreen.buttonQuit.addEventListener(MouseEvent.CLICK, onQuitGameScreen);
			_gameScreen.buttonPause.addEventListener(MouseEvent.CLICK, onGotoPause);
			
			if (!_pause)
			{
				_score = 0;
				_lines = 0;
				_level = 0;
				_timer.delay = SPEED_START;
				_tetris.restart();
			}
			stage.addEventListener(Event.ENTER_FRAME, onStageEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onTetrisKeyDown);
			_timer.addEventListener(TimerEvent.TIMER, onTetrisTic);
			_timer.start();
		}
		
		private function stopPlaying():void
		{
			_gameScreen.buttonQuit.removeEventListener(MouseEvent.CLICK, onQuitGameScreen);
			stage.removeEventListener(Event.ENTER_FRAME, onStageEnterFrame);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onTetrisKeyDown);
			_timer.removeEventListener(TimerEvent.TIMER, onTetrisTic);
			_timer.stop();
		}
		
		private function onStageEnterFrame(e:Event):void 
		{
			_tetris.draw();
			_gameScreen.scoreTextField.text = "Score: " + _score;
			_gameScreen.linesTextField.text = "Lines: " + _lines;
			_gameScreen.levelTextField.text = "Level: " + (_level + 1);
		}
		
		private function onTetrisKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.DOWN) 
			{
				down();
			}
			else if (e.keyCode == Keyboard.UP)
			{
				TetrisEvent.dispatcher.addEventListener(TetrisEvent.FIGURE_ROTATE, onFigureRotate);
				_tetris.rotate();
			}
			else if (e.keyCode == Keyboard.LEFT)
			{
				_tetris.left();
			}
			else if (e.keyCode == Keyboard.RIGHT)
			{
				_tetris.right();
			}
		}
		
		private function onFigureRotate(e:TetrisEvent):void 
		{
			TetrisEvent.dispatcher.removeEventListener(TetrisEvent.FIGURE_ROTATE, onFigureRotate);
			soundRotateSfx.play();
		}
		
		private function onFigureReflectInField(e:TetrisEvent):void 
		{
			TetrisEvent.dispatcher.removeEventListener(TetrisEvent.FIGURE_REFLECT_IN_FIELD, onFigureReflectInField);
			soundReflectSfx.play();
		}
		
		private function onRemoveFilledLines(e:TetrisEvent):void 
		{
			TetrisEvent.dispatcher.removeEventListener(TetrisEvent.REMOVE_FILLED_LINES, onRemoveFilledLines);
			soundRemoveLinesSfx.play();
		}	
		
		private function onTetrisTic(e:TimerEvent = null):void 
		{
			down();
		}
		
		private function down():void
		{
			if (_tetris.down()) return;
			
			TetrisEvent.dispatcher.addEventListener(TetrisEvent.FIGURE_REFLECT_IN_FIELD, onFigureReflectInField);
			_tetris.reflectCurrentInField();
			
			TetrisEvent.dispatcher.addEventListener(TetrisEvent.REMOVE_FILLED_LINES, onRemoveFilledLines);
			if(!updateScore(_tetris.removeFilledLines())) 
			{
				TetrisEvent.dispatcher.removeEventListener(TetrisEvent.REMOVE_FILLED_LINES, onRemoveFilledLines);
			} 
			if (!_tetris.newFigure()) 
			{
				stopPlaying();
				_gameOver = true;
				soundGameOverSfx.play();
				addChild(_gameOverScreen);
				placeBackground(_gameOverScreen);
				_gameOverScreen.buttonQuit.addEventListener(MouseEvent.CLICK, onQuitGameOverScreen);
				_gameOverScreen.buttonPlay.addEventListener(MouseEvent.CLICK, onGameStart);
			}
		}
	
		private function updateScore(lines:int):int
		{
			_lines += lines;
			if (lines)
			{
				_score += SCORE_MULT[lines];
			}
			var level:int = int(_score / SPEED_START);
			if (level > _level) 
			{
				_level++;
				_timer.delay *= SPEED_MULT;
			}
			return lines;
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