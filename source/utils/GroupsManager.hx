package utils;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.FlxBasic;
import flixel.FlxObject;

class GroupsManager extends FlxBasic
{
    public static var manager(default, null) : GroupsManager = new GroupsManager();

    public var playersGroup : FlxGroup;
    public var collidableMapGroup : FlxGroup;
    public var enemiesGroup : FlxGroup;
    public var entities : FlxGroup;

    public function new()
    {
        super();

        playersGroup = new FlxGroup();
        collidableMapGroup = new FlxGroup();
        enemiesGroup = new FlxGroup();
        entities = new FlxGroup();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        
        collisions();
    }

    private function collisions():Void
    {
        FlxG.collide(playersGroup, enemiesGroup);
    }


}