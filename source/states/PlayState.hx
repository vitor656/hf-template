package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxColor;
import utils.LevelLoader;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		LevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
