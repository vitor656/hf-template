package utils;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;

class ControlsHandler
{
    public static function pressedLeft() : Bool
    {
        if(FlxG.keys.anyPressed([LEFT, A]))
            return true;

        return false;
    }

    public static function pressedRight() : Bool
    {
        if(FlxG.keys.anyPressed([RIGHT, D]))
            return true;

        return false;
    }

    public static function pressedUp() : Bool
    {
        if(FlxG.keys.anyPressed([UP, W]))
            return true;

        return false;
    }

    public static function pressedDown() : Bool
    {
        if(FlxG.keys.anyPressed([DOWN, S]))
            return true;

        return false;
    }

    public static function justPressedJump() : Bool
    {
        if(FlxG.keys.anyJustPressed([SPACE, Z]))
            return true;

        return false;
    }

    public static function pressedJump() : Bool
    {
        if(FlxG.keys.anyPressed([SPACE, Z]))
            return true;

        return false;
    }

    public static function releasedJump() : Bool
    {
        if(FlxG.keys.anyJustReleased([SPACE, Z]))
            return true;

        return false;
    }

    public static function justPressedPause() : Bool
    {
        if(FlxG.keys.justPressed.ESCAPE)
            return true;

        return false;
    }

    public static function justpPressedConfirm() : Bool
    {
        if(FlxG.keys.anyJustPressed([SPACE, ENTER, Z]))
            return true;

        return false;
    }
    
    public static function justpPressedBack() : Bool
    {
        if(FlxG.keys.anyJustPressed([ESCAPE, X]))
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