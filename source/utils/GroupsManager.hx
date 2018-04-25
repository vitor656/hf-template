package utils;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;

class GroupsManager
{
    public static var playersGroup : FlxGroup = new FlxGroup();
    public static var collidableMapGroup : FlxGroup = new FlxGroup();
    public static var enemiesGroup : FlxGroup = new FlxGroup();
    public static var entities : FlxGroup = new FlxGroup();
}