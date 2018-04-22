package states;

import flixel.FlxState;
import utils.LevelLoader;
import objects.Player;
import utils.Dialogue;
import utils.ControlsHandler;
import flixel.FlxG;

class PlayGroundState extends FlxState
{
    public var player : Player;

    override public function create():Void
    {
        super.create();

		// LevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);
        add(Dialogue.instance._typeText);
        Dialogue.instance.startDialogue("test");
		
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsHandler.justpPressedFullscreen()) 
            FlxG.fullscreen = !FlxG.fullscreen;
    }
}