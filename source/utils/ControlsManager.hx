package utils;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxBasic;

class ControlsManager extends FlxBasic
{

    // Add the manager to the state in order to use GamePad
    public static var manager(default, null) : ControlsManager = new ControlsManager();

    public static var gamepad : FlxGamepad;
    public inline static var AXIS_VALUE_MIN = 0.4;

    public function new()
    {
        super();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(FlxG.gamepads.getByID(0) != null){
            gamepad = FlxG.gamepads.getByID(0);
        } else {
            gamepad = null;
        }
    }

    public static function pressedLeft() : Bool
    {
        if(FlxG.keys.anyPressed([LEFT, A]) || 
        (gamepad != null && (gamepad.pressed.DPAD_LEFT || gamepad.analog.value.LEFT_STICK_X < -AXIS_VALUE_MIN)))
            return true;

        return false;
    }

    public static function pressedRight() : Bool
    {
        if(FlxG.keys.anyPressed([RIGHT, D]) ||
        (gamepad != null && (gamepad.pressed.DPAD_RIGHT || gamepad.analog.value.LEFT_STICK_X > AXIS_VALUE_MIN)))
            return true;

        return false;
    }

    public static function pressedUp() : Bool
    {
        if(FlxG.keys.anyPressed([UP, W]) ||
        (gamepad != null && (gamepad.pressed.DPAD_UP || gamepad.analog.value.LEFT_STICK_Y < -AXIS_VALUE_MIN)))
            return true;

        return false;
    }

    public static function pressedDown() : Bool
    {
        if(FlxG.keys.anyPressed([DOWN, S]) ||
        (gamepad != null && (gamepad.pressed.DPAD_DOWN || gamepad.analog.value.LEFT_STICK_Y > AXIS_VALUE_MIN)))
            return true;

        return false;
    }

    public static function justPressedJump() : Bool
    {
        if(FlxG.keys.anyJustPressed([SPACE, Z]) ||
        (gamepad != null && gamepad.justPressed.A))
            return true;

        return false;
    }

    public static function pressedJump() : Bool
    {
        if(FlxG.keys.anyPressed([SPACE, Z]) ||
        (gamepad != null && gamepad.pressed.A))
            return true;

        return false;
    }

    public static function releasedJump() : Bool
    {
        if(FlxG.keys.anyJustReleased([SPACE, Z]) ||
        (gamepad != null && gamepad.justReleased.A))
            return true;

        return false;
    }

    public static function justPressedPause() : Bool
    {
        if(FlxG.keys.justPressed.ESCAPE ||
        (gamepad != null && gamepad.justPressed.START))
            return true;

        return false;
    }

    public static function justpPressedConfirm() : Bool
    {
        if(FlxG.keys.anyJustPressed([SPACE, ENTER, Z]) ||
        (gamepad != null && gamepad.justPressed.A))
            return true;

        return false;
    }
    
    public static function justpPressedBack() : Bool
    {
        if(FlxG.keys.anyJustPressed([ESCAPE, X]) ||
        (gamepad != null && gamepad.justPressed.B))
            return true;

        return false;
    }

    public static function justpPressedFullscreen() : Bool
    {
        if(FlxG.keys.pressed.ALT && FlxG.keys.justPressed.ENTER)
            return true;

        return false;
    }

}