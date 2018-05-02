package states;

import flixel.FlxState;
import utils.TiledLevelLoader;
import utils.LevelLoader;
import objects.Player;
import utils.DialogueManager;
import utils.ControlsManager;
import flixel.addons.text.FlxTypeText;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import utils.GroupsManager;
import flixel.addons.display.FlxBackdrop;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxColor;
import flixel.FlxCamera.FlxCameraFollowStyle;

class PlayGroundState extends FlxState
{
    public var player : Player;
    public var _dialogue : DialogueManager;
    public var _level : FlxTilemap;
    public var backdrop : FlxBackdrop;

    override public function create():Void
    {
        super.create();

        FlxG.camera.bgColor = FlxColor.CYAN;

        //add(GroupsManager.manager);
		//TiledLevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);
        LevelLoader.loadLevel(this, "level2");
        add(player = new Player(100, 100));

        FlxG.camera.follow(player, SCREEN_BY_SCREEN);
        
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsManager.justpPressedFullscreen()) 
            FlxG.fullscreen = !FlxG.fullscreen;
    }
}