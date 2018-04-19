package objects;

import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.FlxCamera;

class HUD extends FlxSpriteGroup
{
    private var _textScore : FlxText;

    static inline var OFFSET : Int  = 4;

    public function new()
    {
        super();

        _textScore = new FlxText(OFFSET, OFFSET, 0);

        add(_textScore);

        forEach(function(member){
            member.scrollFactor.set(0, 0);
        }, false);

        setupFont();
    }

    override public function update(elapsed : Float) : Void
    {
        _textScore.text = "SCORE: " + StringTools.lpad(Std.string(Reg.score), "0", 5);

        super.update(elapsed);
    }

    public function setupFont()
    {
        forEachOfType(FlxText, function(member){
            // member.setFormat(AssetPaths.pixel_font__ttf, 8, FlxColor.WHITE,
			// 	FlxTextBorderStyle.OUTLINE, 0xff005784);
        });
    }

    public function setupHUDCamera(cam : FlxCamera)
    {
        forEach(function(member){
            member.scrollFactor.set(0, 0);
            member.cameras = [cam];
        });
    }
}