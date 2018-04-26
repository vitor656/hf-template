package objects;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import utils.ControlsHandler;
import utils.TiledLevelLoader;
import utils.LevelLoader;
import utils.GroupsManager;
import flixel.FlxObject;

class Player extends FlxSprite 
{
	public static var SPEED : Int = 60;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(8, 8, FlxColor.ORANGE);
		GroupsManager.manager.playersGroup.add(this);
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
		// For collisions with the map, uses FlxObject.separate()
		FlxObject.separate(this, LevelLoader.currentCollidableMap);
	}
	
}