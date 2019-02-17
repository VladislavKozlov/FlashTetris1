package sound 
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;
	
	/**
	 * Sound effect object used to play embedded sounds.
	 * ...
	 * @author Vladislav Kozlov <k2v.akosa@gmail.com>
	 */
	public class Sfx 
	{
		private var _vol:Number = 1;
		private var _pan:Number = 0;
		private var _sound:Sound;
		private var _channel:SoundChannel;
		private var _transform:SoundTransform = new SoundTransform;
		private var _position:Number = 0;
		private var _looping:Boolean;
		
		private static var _sounds:Dictionary = new Dictionary;
		
		public var complete:Function;
		
		public function Sfx(source:Class, complete:Function = null) 
		{
			_sound = _sounds[source];
			if (!_sound) _sound = _sounds[source] = new source;
			this.complete = complete;
		}
		
		public function play(vol:Number = 1, pan:Number = 0):void
		{
			if (_channel) stop();
			_vol = _transform.volume = vol < 0 ? 0 : vol;
			_pan = _transform.pan = pan < -1 ? -1 : (pan > 1 ? 1 : pan);
			_channel = _sound.play(0, 0, _transform);
			_channel.addEventListener(Event.SOUND_COMPLETE, onComplete);
			_looping = false;
			_position = 0;
		}
		
		public function loop(vol:Number = 1, pan:Number = 0):void
		{
			play(vol, pan);
			_looping = true;
		}
		
		public function stop():Boolean
		{
			if (!_channel) return false;
			_position = _channel.position;
			_channel.removeEventListener(Event.SOUND_COMPLETE, onComplete);
			_channel.stop();
			_channel = null;
			return true;
		}
		
		public function resume():void
		{
			_channel = _sound.play(_position, 0, _transform);
			_channel.addEventListener(Event.SOUND_COMPLETE, onComplete);
			_position = 0;
		}
		
		private function onComplete(e:Event = null):void
		{
			if (_looping) loop(_vol, _pan);
			else stop();
			_position = 0;
			if (complete != null) complete();
		}
		
		public function get volume():Number { return _vol; }
		public function set volume(value:Number):void
		{
			if (value < 0) value = 0;
			if (!_channel || _vol == value) return;
			_vol = _transform.volume = value;
			_channel.soundTransform = _transform;
		}
		
		public function get pan():Number { return _pan; }
		public function set pan(value:Number):void
		{
			if (value < -1) value = -1;
			if (value > 1) value = 1;
			if (!_channel || _pan == value) return;
			_pan = _transform.pan = value;
			_channel.soundTransform = _transform;
		}
		
		public function get playing():Boolean { return _channel != null; }
		
		public function get position():Number { return (_channel ? _channel.position : _position) / 1000; }
		
		public function get length():Number { return _sound.length / 1000; }
		
	}
}