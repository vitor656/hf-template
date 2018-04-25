package states;

import flixel.FlxState;
import utils.TiledLevelLoader;
import utils.LevelLoader;
import objects.Player;
import utils.Dialogue;
import utils.ControlsHandler;
import flixel.addons.text.FlxTypeText;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import utils.GroupsManager;
import flixel.addons.display.FlxBackdrop;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxColor;

class PlayGroundState extends FlxState
{
    public var player : Player;
    public var _dialogue : Dialogue;
    public var _level : FlxTilemap;

    override public function create():Void
    {
        super.create();

        // add(GroupsManager.manager);
		// TiledLevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);
        LevelLoader.loadLevel(this, "level");
        FlxG.camera.bgColor = FlxColor.WHITE;

    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsHandler.justpPressedFullscreen()) 
            FlxG.fullscreen = !FlxG.fullscreen;
    }
}