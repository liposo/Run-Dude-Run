package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	/**
	 * ...
	 * @author Felipe
	 */
	public class PlayState extends FlxState 
	{
		[Embed(source = "../assets/mapCSV_Group1_up.csv", mimeType = "application/octet-stream")] public var menuFloorUpCSV:Class;
		[Embed(source = "../assets/mapCSV_Group1_Floor.csv", mimeType = "application/octet-stream")] public var menuFloorCSV:Class;
		[Embed(source = "../assets/tiles.png")] public var mapTilesPNG:Class;
		[Embed(source = "../assets/background.png")] public var backgroundPNG:Class;
		
		private var menuFloor:FlxTilemap;
		private var menuFloorUp:FlxTilemap;
		private var player:Player;
		private var timer:FlxDelay;
		private var backgroundIMG:FlxSprite;
		
		public function PlayState() 
		{
			
		}
		
		override public function create():void
		{
			backgroundIMG = new FlxSprite(0, 0, backgroundPNG);
			
			menuFloor = new FlxTilemap;
			menuFloor.loadMap(new menuFloorCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);

			menuFloorUp = new FlxTilemap;
			menuFloorUp.loadMap(new menuFloorUpCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);
				
			player = new Player(-30, 328);
			
			add(backgroundIMG);		
			add(menuFloor);
			add(menuFloorUp);
			add(player);
		
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
			
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, menuFloor);
		}
		
		override public function destroy():void
		{	
			super.destroy();
		}
	}

}