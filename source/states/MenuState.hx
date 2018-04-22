package states;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flash.system.System;
import utils.ControlsHandler;

class MenuState extends FlxState
{

    private var _btnStart : FlxButton;
    private var _btnExit : FlxButton;

    private var _menuEntries : Array<String> = ["New Game", "Exit"];

    override public function create():Void
    {
        super.create();

        _btnStart = new FlxButton(0, 0, _menuEntries[0], resolveChoice.bind(0));
        _btnStart.screenCenter();
        _btnExit = new FlxButton(0, 0, _menuEntries[1], resolveChoice.bind(1));
        _btnExit.screenCenter();
        _btnExit.y += 30;

        add(_btnStart);
        add(_btnExit);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(ControlsHandler.justpPressedFullscreen())
            FlxG.fullscreen = !FlxG.fullscreen;
    }

    public function resolveChoice(choice : Int) : Void
    {
        switch(choice){
            case 0: FlxG.switchState(new PlayState());
            case 1: System.exit(0);
        }
    }
}