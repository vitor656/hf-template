package states;

import flixel.FlxState;
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

class PlayGroundState extends FlxState
{
    public var player : Player;
    public var _dialogue : Dialogue;

    override public function create():Void
    {
        super.create();

        add(GroupsManager.manager);

		LevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);

    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsHandler.justpPressedFullscreen()) 
            FlxG.fullscreen = !FlxG.fullscreen;
    }
}