package utils;

import flixel.addons.text.FlxTypeText;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.FlxBasic;
import utils.ControlsHandler;

class Dialogue extends FlxBasic
{

    public inline static var DELAY_NORMAL:Float = 0.1;
    public inline static var DELAY_FAST:Float = 0.05;

    public var _typeText : FlxTypeText;
    private var _messages : Array<String>;
    private var _currentIndex : Int;
    private var currentMessage : String;
    private var loadedDialogueId : String;

    private var isComplete : Bool;
    
    public function new(dialogueReceiver:FlxTypeText)
    {
        super();
        loadDialogueReceiver(dialogueReceiver);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if(_typeText != null){  
            if(isComplete){
                if(ControlsHandler.justpPressedConfirm())
                    loadNextmessage();
            } else {
                if(FlxG.keys.pressed.SPACE)
                    _typeText.delay = DELAY_FAST;
                else
                    _typeText.delay = DELAY_NORMAL;
            }
        }
    }

    public function loadDialogueReceiver(dialogueReceiver:FlxTypeText)
    {
        _typeText = dialogueReceiver;
        setupDialogueReceiver();
    }

    private function setupDialogueReceiver():Void
    {
        if(_typeText != null){
            _typeText.skipKeys = [];
            _typeText.scrollFactor.set(0, 0);
        }
    }

    public function startDialogue(?state:FlxState, ?id:String)
    {
        if(id != null && id != ""){
            loadDialogue(id);
        }

        if(_typeText != null){
            if(state != null)
                state.add(_typeText);

            isComplete = false;
            _typeText.resetText(currentMessage);
            _typeText.start(DELAY_NORMAL, false, false, onCompleteClick);
        }

    }

    // Load messages from some kind of file maybe?
    public function loadDialogue(id:String)
    {
        _messages = new Array<String>();

        switch(id){
            case "teste":
                _messages.push("Mensagem 1 Mensagem 1 Mensagem 1");
                _messages.push("Mensagem 2 Mensagem 2 Mensagem 2");
                _messages.push("Mensagem 3 Mensagem 3 Mensagem 3");
        }

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
        if(_messages != null && _typeText != null){
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