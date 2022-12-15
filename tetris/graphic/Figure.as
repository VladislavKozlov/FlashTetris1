package  tetris.graphic
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import tetris.Assets;
	
	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class Figure extends Sprite 
	{
		private var _figureType:int;
		private var _figureVector:Vector.<int>;
		private var _figureBlocks:Array;
		private var _figureCoordinates:Array = [];
		private var _x:int;
		private var _y:int;
		private var _size:int;
		private var _widthField:int;
		private var _blockCub:Array = [];
		private var _blockPalka:Array = [];
		private var _blockZleft:Array = [];
		private var _blockZright:Array = [];
		private var _blockT:Array = [];
		private var _blockL:Array = [];
		private var _blockG:Array = [];
		private var _blockCubeBD:BitmapData;
		private var _blockPalkaBD:BitmapData;
		private var _blockZleftBD:BitmapData;
		private var _blockZrightBD:BitmapData;
		private var _blockTBD:BitmapData;
		private var _blockLBD:BitmapData;
		private var _blockGBD:BitmapData;
		private var _blocksLength:int;
		private var _figureBlockInit:Boolean = false;
		private var _tetrisCont:DisplayObjectContainer;
		
		public function Figure(gameContainer:DisplayObjectContainer, size:int, blocksLength:int, width:int)
		{
			_tetrisCont = gameContainer;
			_size = size;
			_blocksLength = blocksLength;
			_widthField = width;
			
			function blocksArrayInit(blocks:Array, asset:BitmapData):void
			{
				for (var r:int = 0; r < _blocksLength; r++)
				{
					var block:Bitmap = new Bitmap(asset);
					blocks.push(block);
				}
			};
			
			_figureBlocks = [];			
			var blockCub:Bitmap = new Bitmap();
			blockCub = Assets.shape1;
			_blockCubeBD = blockCub.bitmapData;
			blocksArrayInit(_blockCub, _blockCubeBD);			
			var blockPalka:Bitmap = new Bitmap();
			blockPalka = Assets.shape7;
			_blockPalkaBD = blockPalka.bitmapData;
			blocksArrayInit(_blockPalka, _blockPalkaBD);			
			var blockZleft:Bitmap = new Bitmap();
			blockZleft = Assets.shape3;
			_blockZleftBD = blockZleft.bitmapData;
			blocksArrayInit(_blockZleft, _blockZleftBD);			
			var blockZright:Bitmap = new Bitmap();
			blockZright = Assets.shape4;
			_blockZrightBD = blockZright.bitmapData;
			blocksArrayInit(_blockZright, _blockZrightBD);			
			var blockT:Bitmap = new Bitmap();
			blockT = Assets.shape2;
			_blockTBD = blockT.bitmapData;
			blocksArrayInit(_blockT, _blockTBD);			
			var blockL:Bitmap = new Bitmap();
			blockL = Assets.shape6;
			_blockLBD = blockL.bitmapData;
			blocksArrayInit(_blockL, _blockLBD);			
			var blockG:Bitmap = new Bitmap();
			blockG = Assets.shape5;
			_blockGBD = blockG.bitmapData;
			blocksArrayInit(_blockG, _blockGBD);
		}
		
		public function createFigure(figureVector:Vector.<int>, figureType:int, x:int = 0, y:int = 0):void
		{
			var xf:int;
			var yf:int;
			_x = x;
			_y = y;			
			_figureVector = figureVector;
			_figureType = figureType;			
			figureArrayInit(_figureType, _figureBlocks);			
			_figureCoordinates = [];
			
			if (_x ==0 && _y == 0)//if nextFigure
			{
				for (var i:int = 0; i < _figureVector.length; i += 2 ) 
				{
					xf =  _widthField + 1 + _figureVector[i];
					yf = 1 + _figureVector[i + 1];
			
					_figureCoordinates[i] = xf * _size;
					_figureCoordinates[i + 1] = yf * _size;
				}
			}
			else
			{
				for (var j:int = 0; j < _figureVector.length; j += 2 ) 
				{
					xf = _x + _figureVector[j];
					yf = _y + _figureVector[j + 1];
			
					_figureCoordinates[j] = xf * _size;
					_figureCoordinates[j + 1] = yf * _size;
				}
			}			
			figureDraw(_figureCoordinates, _figureBlocks, _figureVector);
			
			for (var l:int = 0; l < _blocksLength; l++)
			{
				_tetrisCont.addChild(_figureBlocks[l]);
			}
			_figureBlockInit = true;			
		}
	
		public function removeFigure():void
		{
			_figureVector = null;
			_figureType = 0;			
			if (_figureBlockInit)
			{
				for (var r:int = 0; r < _blocksLength; r++)
				{
					_tetrisCont.removeChild(_figureBlocks[r]);
				}
				_figureBlockInit = false;
			}
		}
		
		private function figureDraw(figureCoordinates:Array, arrayFigure:Array, figureVector:Vector.<int>):void
		{
			var xCoordinate:Array = [];
			var yCoordinate:Array = [];
			
			var num:int = 0;
			for (var k:int = 0; k < figureCoordinates.length; k += 2) 
			{
				xCoordinate[num] = figureCoordinates[k];
				yCoordinate[num] = figureCoordinates[k + 1];
				num++;
			}
			for (var j:int = 0; j < _blocksLength; j++)
			{
				arrayFigure[j].x = xCoordinate[j];
				arrayFigure[j].y = yCoordinate[j];
			}	
		}
		
		private function figureArrayInit(typeFigure:int, arrayFigure:Array):void
		{	
			if (typeFigure == 0)
			{
				for (var j:int = 0; j < _blocksLength; j++)
				{
					arrayFigure[j] = _blockCub[j];
				}
			}
			if (typeFigure == 1)
			{
				for (var l:int = 0; l < _blocksLength; l++)
				{
					arrayFigure[l] = _blockPalka[l];
				}	
			}
			if (typeFigure == 2)
			{
				for (var n:int = 0; n < _blocksLength; n++)
				{
					arrayFigure[n] = _blockZleft[n];
				}
			}
			if (typeFigure == 3)
			{
				for (var r:int = 0; r < _blocksLength; r++)
				{
					arrayFigure[r] = _blockZright[r];
				}
			}
			if (typeFigure == 4)
			{
				for (var t:int = 0; t < _blocksLength; t++)
				{
					arrayFigure[t] = _blockT[t];
				}
			}
			if (typeFigure == 5)
			{
				for (var h:int = 0; h < _blocksLength; h++)
				{
					arrayFigure[h] = _blockL[h];
				}
			}
			if (typeFigure == 6)
			{
				for (var w:int = 0; w < _blocksLength; w++)
				{
					arrayFigure[w] = _blockG[w];
				}
			}	
		}
	}
}