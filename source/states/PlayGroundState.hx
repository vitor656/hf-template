package states;

import flixel.FlxState;
import utils.LevelLoader;
import objects.Player;
import utils.Dialogue;
import utils.ControlsHandler;
import flixel.addons.text.FlxTypeText;
import flixel.FlxG;

class PlayGroundState extends FlxState
{
    public var player : Player;
    public var _dialogue : Dialogue;

    override public function create():Void
    {
        super.create();

		// LevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);

        _dialogue = new Dialogue(new FlxTypeText(0, 0, 100, ""));
        add(_dialogue);
        _dialogue.startDialogue(this, "teste");

    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsHandler.justpPressedFullscreen()) 
            FlxG.fullscreen = !FlxG.fullscreen;
    }
}