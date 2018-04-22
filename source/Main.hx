package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.PlayState;
import states.MenuState;
import states.PlayGroundState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(320, 180, PlayGroundState));
	}
}
