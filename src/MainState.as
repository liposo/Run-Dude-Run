package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	/**
	 * ...
	 * @author Felipe
	 */
	public class MainState extends FlxState 
	{
		[Embed(source = "../assets/mapCSV_Group1_up.csv", mimeType = "application/octet-stream")] public var menuFloorUpCSV:Class;
		[Embed(source = "../assets/mapCSV_Group1_Floor.csv", mimeType = "application/octet-stream")] public var menuFloorCSV:Class;
		[Embed(source = "../assets/tiles.png")] public var mapTilesPNG:Class;
		[Embed(source = "../assets/background.png")] public var backgroundPNG:Class;
		[Embed(source = "../assets/music.mp3")] public var musicMP3:Class;
		
		private var title1:FlxText;
		private var title2:FlxText;
		private var menuFloor:FlxTilemap;
		private var menuFloorUp:FlxTilemap;
		private var player:Player;
		private var timer:FlxDelay;
		private var backgroundIMG:FlxSprite;
		
		public function MainState()
		{
			
		}
		
		override public function create():void
		{
			super.create();
			
			timer = new FlxDelay(3000);
			timer.start();
			
			backgroundIMG = new FlxSprite(0, 0, backgroundPNG);
			
			title1 = new FlxText(0, 0, 150);
			title1.size = 40;
			title1.x = FlxG.width / 2 - 75;
			title1.y = 80;
			title1.shadow = 0xff000000;
			title1.text = "Run... ";
			
			title2 = new FlxText(0, 0, 500);
			title2.size = 60;
			title2.x = FlxG.width / 2 - 200;
			title2.y = 80;
			title2.color = 0xFFCC0000;
			title2.shadow = 0xff000000;
			title2.text = "DUDE RUN!!!";
			title2.flicker(20);
						
			menuFloor = new FlxTilemap;
			menuFloor.loadMap(new menuFloorCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);

			menuFloorUp = new FlxTilemap;
			menuFloorUp.loadMap(new menuFloorUpCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);
				
			player = new Player(32, 100);
					
			add(backgroundIMG);
			add(title1);		
			add(menuFloor);
			add(menuFloorUp);
			add(player);
		
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
			FlxG.watch(player, "y", "yp");
		} 
		
		override public function update():void
		{
			super.update();
			
			if (timer.hasExpired)
			{
				//	If 1000ms (1 second) has passed then the timer expires
				FlxG.play(musicMP3, 1, true);
				title1.kill();
				add(title2);
				
			}
					
			if (player.x > FlxG.width)
			{
				FlxG.switchState(new PlayState);
			}
			FlxG.collide(player, menuFloor);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	}

}