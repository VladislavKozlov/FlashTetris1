package  tetris.graphic
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import tetris.Assets;
	
	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class Field extends Sprite 
	{
		private var _widthField:int; 
		private var _heightField:int; 
		private var _fieldVector:Vector.<Vector.<int>>;
		private var _fieldBlocks:Array;
		private var _fieldLengthBlocks:int;
		private var _size:int;	
		private var _blockCubeBD:BitmapData;
		private var _blockPalkaBD:BitmapData;
		private var _blockZleftBD:BitmapData;
		private var _blockZrightBD:BitmapData;
		private var _blockTBD:BitmapData;
		private var _blockLBD:BitmapData;
		private var _blockGBD:BitmapData;
		private var _indeksRect:int;
		private var _tetrisCont:DisplayObjectContainer;
		
		public function Field(gameContainer:DisplayObjectContainer, height:int, width:int, size:int) 
		{
			_tetrisCont = gameContainer;
			_heightField = height;
			_widthField = width;
			_size = size;
			_fieldBlocks = [];
			
			var blockCub:Bitmap = new Bitmap();
			blockCub = Assets.shape1;
			_blockCubeBD = blockCub.bitmapData;			
			var blockPalka:Bitmap = new Bitmap();
			blockPalka = Assets.shape7;
			_blockPalkaBD = blockPalka.bitmapData;			
			var blockZleft:Bitmap = new Bitmap();
			blockZleft = Assets.shape3;
			_blockZleftBD = blockZleft.bitmapData;			
			var blockZright:Bitmap = new Bitmap();
			blockZright = Assets.shape4;
			_blockZrightBD = blockZright.bitmapData;			
			var blockT:Bitmap = new Bitmap();
			blockT = Assets.shape2;
			_blockTBD = blockT.bitmapData;			
			var blockL:Bitmap = new Bitmap();
			blockL = Assets.shape6;
			_blockLBD = blockL.bitmapData;			
			var blockG:Bitmap = new Bitmap();
			blockG = Assets.shape5;
			_blockGBD = blockG.bitmapData;		
		}
		
		public function createField(fieldVector:Vector.<Vector.<int>>):void
		{
			_fieldVector = fieldVector;			
			_indeksRect = 0;
			var block:Array = [];
			
			for (var y:int = 0; y < _heightField; y++ ) 
			{
				for (var x:int = 0; x < _widthField; x++ ) 
				{
					fieldDraw(_fieldVector[y][x], x, y);
				}	
			}
			
			function fieldDraw(fieldPointType:int, xc:int, yc:int):void
			{
				if (fieldPointType == 1)//cube
				{
					block[_indeksRect] = new Bitmap(_blockCubeBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}
				if (fieldPointType == 2)//palka
				{
					block[_indeksRect] = new Bitmap(_blockPalkaBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}
				if (fieldPointType == 3)//z_left
				{
					block[_indeksRect] = new Bitmap(_blockZleftBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}
				if (fieldPointType == 4)//z_right
				{
					block[_indeksRect] = new Bitmap(_blockZrightBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}
				if (fieldPointType == 5)//T
				{
					block[_indeksRect] = new Bitmap(_blockTBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}
				if (fieldPointType == 6)//L
				{
					block[_indeksRect] = new Bitmap(_blockLBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}
				if (fieldPointType == 7)//G
				{
					block[_indeksRect] = new Bitmap(_blockGBD);
					block[_indeksRect].x = xc * _size;
					block[_indeksRect].y = yc * _size;
					_fieldBlocks.push(block[_indeksRect]);
					_indeksRect++;
				}	
			};
			
			for (var l:int = 0; l < _fieldBlocks.length; l++)
			{
				_tetrisCont.addChild(_fieldBlocks[l]);
			}			
		}
	
		public function removeField():void
		{
			_fieldVector = null;			
			_fieldLengthBlocks = _fieldBlocks.length;
			if (_fieldLengthBlocks)
			{
				for (var r:int = 0; r < _fieldLengthBlocks; r++)
				{
					_tetrisCont.removeChild(_fieldBlocks[r]);
				}
				_fieldBlocks = [];
			}
		}
	}
}