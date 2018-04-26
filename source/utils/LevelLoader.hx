package utils;

import flixel.tile.FlxTilemap;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import utils.GroupsManager;

// LevelLoader to be used for non-Tiled based levels
class LevelLoader
{
    public static var currentLevel : String;
	public static var currentLevelPath : String;

    public static var currentCollidableMap : FlxTilemap;

    public static function loadLevel(state:FlxState, level:String):Void
    {
        currentLevel = level;
        currentLevelPath = "assets/data/" + level + ".csv";

        var _level = new FlxTilemap();
		_level.loadMapFromCSV(currentLevelPath, FlxGraphic.fromClass(GraphicAuto), 8, 8, AUTO);
        currentCollidableMap = _level;
        GroupsManager.manager.collidableMapGroup.add(currentCollidableMap);
		state.add(_level);
    }
}