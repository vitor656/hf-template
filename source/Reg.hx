package;

import states.PlayState;

class Reg
{
    public static var levels : Array<String> = [
        "level"
    ];
    public static var currentLevelIndex : Int = 0;

    public static var PS : PlayState;
    public static var score : Int = 0;
    public static var lives : Int = 3;
    public static var isPaused : Bool = false;
}