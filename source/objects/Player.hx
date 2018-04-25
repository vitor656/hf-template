package objects;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import utils.ControlsHandler;
import utils.LevelLoader;

class Player extends FlxSprite 
{
	public static var SPEED : Int = 60;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(16, 16, FlxColor.ORANGE);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (ControlsHandler.pressedUp()){
			velocity.y = -SPEED;
		} else if (ControlsHandler.pressedDown()){
			velocity.y = SPEED;
		} else {
			velocity.y = 0;
		}
		
		if (ControlsHandler.pressedRight()){
			velocity.x = SPEED;
		} else if (ControlsHandler.pressedLeft()) {
			velocity.x = -SPEED;
		} else {
			velocity.x = 0;
		}

		collisions();
	}

	public function collisions()
	{
		FlxG.collide(this, LevelLoader.currentCollidableMap);
	}
	
}