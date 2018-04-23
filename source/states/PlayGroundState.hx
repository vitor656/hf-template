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
    public var text : FlxTypeText;

    override public function create():Void
    {
        super.create();

		// LevelLoader.setupLevel(this, Reg.levels[Reg.currentLevelIndex]);
        // add(Dialogue.instance);
        // Dialogue.instance.startDialogue(this, "test");

        // text = new FlxTypeText(0, 0, 100, "Hello World");
        // text.screenCenter();
        // add(text);

        // text.start();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsHandler.justpPressedFullscreen()) 
            FlxG.fullscreen = !FlxG.fullscreen;
    }
}