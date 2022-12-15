package tetris
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class Assets 
	{
		[Embed(source="../res/sound/soundRotate.mp3")]
		private static var SoundRotate:Class;
		
		[Embed(source="../res/sound/soundReflect.mp3")]
		private static var SoundReflect:Class;
		
		[Embed(source="../res/sound/soundRemoveLines.mp3")]
		private static var SoundRemove:Class;
		
		[Embed(source="../res/sound/soundGameOver.mp3")]
		private static var SoundGameOver:Class;
		
		[Embed(source="../res/sound/soundButtonDown.mp3")]
		private static var SoundButtonDown:Class;
			
		[Embed(source = "../res/drawable/menuBackground.png")] 
		private static var BackgroundBitmap:Class;
		
		[Embed(source = "../res/drawable/buttonImage.png")] 
		private static var ButtonBitmap:Class;
		
		[Embed(source = "../res/drawable/gameLogo.png")] 
		private static var LogoBitmap:Class;
		
		[Embed(source = "../res/drawable/buttonQuit.png")] 
		private static var ButtonQuit:Class;
		
		[Embed(source = "../res/drawable/buttonPause.png")] 
		private static var ButtonPause:Class;
		
		[Embed(source = "../res/drawable/buttonPlay.png")] 
		private static var ButtonPlay:Class;
		
		[Embed(source = "../res/drawable/shape1.png")] 
		private static var Shape1:Class;
		
		[Embed(source = "../res/drawable/shape2.png")] 
		private static var Shape2:Class;
		
		[Embed(source = "../res/drawable/shape3.png")] 
		private static var Shape3:Class;
		
		[Embed(source = "../res/drawable/shape4.png")] 
		private static var Shape4:Class;
		
		[Embed(source = "../res/drawable/shape5.png")] 
		private static var Shape5:Class;
		
		[Embed(source = "../res/drawable/shape6.png")] 
		private static var Shape6:Class;
		
		[Embed(source = "../res/drawable/shape7.png")] 
		private static var Shape7:Class;
		
		[Embed(source = "../res/drawable/backgroundTetris.png")] 
		private static var BackgroundTetris:Class;
		
		[Embed(source = "../res/drawable/backgroundGeneral.png")] 
		private static var BackgroundGeneral:Class;
		
		[Embed(source = "../res/drawable/backgroundPause.png")] 
		private static var BackgroundPause:Class;
		
		[Embed(source = "../res/drawable/backgroundGameOver.png")] 
		private static var BackgroundGameOver:Class;
		
		[Embed(source = "../res/drawable/backgroundButton.png")] 
		private static var BackgroundButton:Class;
		
		public static function get soundRotate():Class 
		{
			return SoundRotate;
		}
		
		public static function get soundReflect():Class 
		{
			return SoundReflect;
		}
		
		public static function get soundRemove():Class 
		{
			return SoundRemove;
		}
		
		public static function get soundGameOver():Class 
		{
			return SoundGameOver;
		}
		
		public static function get soundButtonDown():Class 
		{
			return SoundButtonDown;
		}
		
		public static function get backgroundBitmap():Bitmap 
		{
			return new BackgroundBitmap() as Bitmap;
		}
		
		public static function get buttonBitmap():Bitmap 
		{
			return new ButtonBitmap() as Bitmap;
		}
		
		public static function get logoBitmap():Bitmap 
		{
			return new LogoBitmap() as Bitmap;
		}
		
		public static function get buttonQuit():Bitmap 
		{
			return new ButtonQuit() as Bitmap;
		}
		
		public static function get buttonPause():Bitmap 
		{
			return new ButtonPause() as Bitmap;
		}
		
		public static function get buttonPlay():Bitmap 
		{
			return new ButtonPlay() as Bitmap;
		}
		
		public static function get shape1():Bitmap 
		{
			return new Shape1() as Bitmap;
		}
		
		public static function get shape2():Bitmap {
			return new Shape2() as Bitmap;
		}
		
		public static function get shape3():Bitmap {
			return new Shape3() as Bitmap;
		}
		
		public static function get shape4():Bitmap {
			return new Shape4() as Bitmap;
		}
		
		public static function get shape5():Bitmap {
			return new Shape5() as Bitmap;
		}
		
		public static function get shape6():Bitmap {
			return new Shape6() as Bitmap;
		}
		
		public static function get shape7():Bitmap {
			return new Shape7() as Bitmap;
		}
		
		public static function get backgroundTetris():Bitmap {
			return new BackgroundTetris() as Bitmap;
		}
		
		public static function get backgroundGeneral():Bitmap {
			return new BackgroundGeneral() as Bitmap;
		}
		
		public static function get backgroundPause():Bitmap {
			return new BackgroundPause() as Bitmap;
		}
		
		public static function get backgroundGameOver():Bitmap {
			return new BackgroundGameOver() as Bitmap;
		}
		
		public static function get backgroundButton():Bitmap {
			return new BackgroundButton() as Bitmap;
		}
	}
}