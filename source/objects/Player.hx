package objects;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;

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
		
		if (FlxG.keys.pressed.W){
			velocity.y = -SPEED;
		} else if (FlxG.keys.pressed.S){
			velocity.y = SPEED;
		} else {
			velocity.y = 0;
		}
		
		if (FlxG.keys.pressed.D){
			velocity.x = SPEED;
		} else if (FlxG.keys.pressed.A) {
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