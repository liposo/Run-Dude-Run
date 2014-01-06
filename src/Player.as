package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	/**
	 * ...
	 * @author Felipe
	 */
	public class Player extends FlxSprite 
	{
		[Embed(source = '../assets/Dude.png')] private var DudePNG:Class;

		public function Player(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(DudePNG, true, true, 48, 80, true);
			addAnimation("idle", [4], 20, false);
			addAnimation("jump", [0, 1, 2, 3], 20, false);
			addAnimation("sprint", [5, 6, 7, 8, 9, 10, 11, 12], 30, true); //arrumar animação!!!
			play("idle");
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			//Control handler from Flixel Power Tools exemple, this will be changed. 
			//	Add this sprite to the FlxControl plugin and tell it we want the sprite to accelerate and decelerate smoothly
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			//	Sprite will be controlled with the left and right cursor keys
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			//	And SPACE BAR will make them jump up to a maximum of 200 pixels (per second), only when touching the FLOOR
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
				
			//	Because we are using the MOVEMENT_ACCELERATES type the first value is the acceleration speed of the sprite
			//	Think of it as the time it takes to reach maximum velocity. A value of 100 means it would take 1 second. A value of 400 means it would take 0.25 of a second.
			FlxControl.player1.setMovementSpeed(500, 0, 100, 200, 400, 0);
			
			//	Set a downward gravity of 400px/sec
			FlxControl.player1.setGravity(0, 400);

			facing = FlxObject.RIGHT;
		}
		
		override public function update():void
		{
			super.update();
			
			if (touching == FlxObject.FLOOR && velocity.x != 0)
			{
				play("sprint");
			}
		}
	}

}