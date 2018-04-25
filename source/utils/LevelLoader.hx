package utils;

import flixel.tile.FlxTilemap;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;

// LevelLoader to be used for non-Tiled based levels
class LevelLoader
{
    public static var currentLevel : String;
	public static var currentLevelPath : String;

    public static function loadLevel(state:FlxState, level:String):Void
    {
        currentLevel = level;
        currentLevelPath = "assets/data/" + level + ".csv";

        var _level = new FlxTilemap();
		_level.loadMapFromCSV(currentLevelPath, FlxGraphic.fromClass(GraphicAuto), 0, 0, AUTO);
		state.add(_level);
    }
}