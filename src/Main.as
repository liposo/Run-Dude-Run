package 
{
	import flash.display.Sprite;
	import flash.events.Event;

	import org.flixel.FlxGame;
	/**
	 * ...
	 * @author Felipe
	 */
	[SWF(width="640", height="420", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame 
	{

		public function Main():void 
		{
			super(640, 480, MainState, 1, 60, 60);
		}

	}

}