package utils;

import flixel.addons.text.FlxTypeText;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.FlxBasic;

class Dialogue extends FlxBasic
{

    public inline static var DELAY_NORMAL:Float = 0.3;
    public inline static var DELAY_FAST:Float = 0.1;

    public var _typeText : FlxTypeText;
    private var _messages : Array<String>;
    private var _currentIndex : Int;
    private var currentMessage : String;
    private var loadedDialogueId : String;

    private var isComplete : Bool;

    public static var instance(default, null) : Dialogue = new Dialogue();

    public function new()
    {
        super();

        _typeText = new FlxTypeText(FlxG.width/2, FlxG.height/2, FlxG.width - 60, "", 8);
        _typeText.skipKeys = [];
        _typeText.scrollFactor.set(0, 0);
        
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if(isComplete){
            if(FlxG.keys.justPressed.SPACE)
                loadNextmessage();
        } else {
            if(FlxG.keys.pressed.SPACE)
                _typeText.delay = DELAY_FAST;
            else
                _typeText.delay = DELAY_NORMAL;
        }

    }

    public function startDialogue(?state:FlxState, ?id:String)
    {
        if(id != null && id != ""){
            loadDialogue(id);
        }

        if(state != null)
            state.add(_typeText);

        isComplete = false;
        _typeText.resetText(currentMessage);
        _typeText.start(DELAY_NORMAL, false, false, onCompleteClick);
    }

    public function loadDialogue(id:String)
    {

        _messages = new Array<String>();

        _messages.push("Mensagem 1 Mensagem 1 Mensagem 1");
        _messages.push("Mensagem 2 Mensagem 2 Mensagem 2");
        _messages.push("Mensagem 3 Mensagem 3 Mensagem 3");

        _currentIndex = 0;
        loadedDialogueId = id;
        currentMessage = _messages[_currentIndex];
    }

    public function onCompleteWait():Void
    {
        new FlxTimer().start(3, function(_){

            loadNextmessage();

        });
    }

    public function onCompleteClick():Void
    {
        isComplete = true;
    }

    private function loadNextmessage(){
        if(_messages != null){
            _currentIndex++;
            if(_currentIndex < _messages.length){
                currentMessage = _messages[_currentIndex];
                startDialogue();
            } else {
                _typeText.destroy();
            }
        }
    }

}