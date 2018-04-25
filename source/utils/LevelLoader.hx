package utils;

import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.addons.tile.FlxTilemapExt;
import flixel.addons.editors.tiled.TiledObject;
import flixel.FlxG;
import states.PlayState;
import objects.Player;
import utils.GroupsManager;


// This class has to be used for Tiled based levels
class LevelLoader 
{

	public static var currentLevel : String;
	public static var currentLevelPath : String;
	public static var currentTiledMap : TiledMap;

	public static var currentCollidableMap : FlxTilemap;

	public inline static var LAYER_MAIN : String = "main";
	public inline static var LAYER_BACKGROUND : String = "background";
	public inline static var LAYER_FOREGROUND : String = "foreground";
	public inline static var LAYER_PLAYER : String = "player";
	public inline static var LAYER_ENEMIES : String = "enemies";
	public inline static var LAYER_COLLECTABLES : String = "collectables";

	public static function setupLevel(state:FlxState, level:String){
		loadLevel(state, level);
		spawnObjects(state, currentTiledMap);
	}

	public static function loadLevel(state:FlxState, level:String)
	{
		currentLevel = level;
		currentLevelPath = "assets/data/" + level + ".tmx";

		var tiledMap = new TiledMap(currentLevelPath);
		
		var mainLayer : TiledTileLayer = cast tiledMap.getLayer(LAYER_MAIN);
		currentCollidableMap = new FlxTilemap();
		currentCollidableMap.loadMapFromArray(
			mainLayer.tileArray, 
			tiledMap.width, 
			tiledMap.height, 
			AssetPaths.tiles_2__png, 
			16, 
			16, 
			1
		);

		GroupsManager.manager.collidableMapGroup.add(currentCollidableMap);
		
		var backgroundLayer : TiledTileLayer = cast tiledMap.getLayer(LAYER_BACKGROUND);
		var backMap = new FlxTilemap();
		backMap.loadMapFromArray(
			backgroundLayer.tileArray, 
			tiledMap.width, 
			tiledMap.height, 
			AssetPaths.tiles_2__png, 
			16, 
			16, 
			1
		);
		backMap.solid = false;

		var foregroundLayer : TiledTileLayer = cast tiledMap.getLayer(LAYER_FOREGROUND);
		var foreMap = new FlxTilemap();
		foreMap.loadMapFromArray(
			foregroundLayer.tileArray, 
			tiledMap.width, 
			tiledMap.height, 
			AssetPaths.tiles_2__png, 
			16, 
			16, 
			1
		);
		foreMap.solid = false;
		
		state.add(backMap);
		state.add(foreMap);
		state.add(currentCollidableMap);

		FlxG.camera.setScrollBoundsRect(0, 0, tiledMap.fullWidth, tiledMap.fullHeight, true);

		currentTiledMap = tiledMap;
		
	}
	
	public static function spawnObjects(state:FlxState, map:TiledMap) : Void
	{
		spawnPlayer(state, map);
		spawnEnemies(state, map);
		spawnCollectables(state, map);
	}

	public static function spawnPlayer(state:FlxState, map:TiledMap) : Void
	{
		var arrPlayer = getLevelObjects(map, LAYER_PLAYER);
		if(arrPlayer != null && arrPlayer.length > 0){
			var playerObject : TiledObject = arrPlayer[0];

			//Choose Player class to instantiate
			(cast state).player = new Player(playerObject.x, playerObject.y);
			//GroupsManager.manager.playersGroup.add((cast state).player);
			state.add((cast state).player);
		}
	}

	public static function spawnEnemies(state:FlxState, map:TiledMap) : Void
	{
		var arrEnemies : Array<TiledObject> = getLevelObjects(map, LAYER_ENEMIES);
		if(arrEnemies != null && arrEnemies.length > 0){

			for(enemyObject in arrEnemies){
				switch(enemyObject.type){
					case "type_1":
					break;
					case "type_2":
					break;
				}
			}

		}
	}

	public static function spawnCollectables(state:FlxState, map:TiledMap) : Void
	{
		var arrCollectables : Array<TiledObject> = getLevelObjects(map, LAYER_COLLECTABLES);
		if(arrCollectables != null && arrCollectables.length > 0){

			for(collectableObject in arrCollectables){
				switch(collectableObject.type){
					case "type_1":
					break;
					case "type_2":
					break;
				}
			}

		}
	}
	
	public static function getLevelObjects(map:TiledMap, layer:String) : Array<TiledObject>
	{
		if (map != null && map.getLayer(layer) != null){
			var objLayer : TiledObjectLayer = cast map.getLayer(layer);
			return objLayer.objects;
		} else {
			trace(layer + " layer not found.");
			
			return [];
		}
	}
}