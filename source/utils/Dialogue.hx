package utils;

import flixel.addons.text.FlxTypeText;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxState;

class Dialogue
{

    public var _typeText : FlxTypeText;
    private var _messages : Array<String>;
    private var _currentIndex : Int;
    private var currentMessage : String;
    private var loadedDialogueId : String;

    public static var instance(default, null) : Dialogue = new Dialogue();

    public function new()
    {
        _typeText = new FlxTypeText(FlxG.width/2, FlxG.height/2, FlxG.width - 60, "", 8);
        _typeText.skipKeys = ["SPACE", "ENTER"];
        _typeText.scrollFactor.set(0, 0);
    }

    public function startDialogue(?state:FlxState, ?id:String)
    {
        if(id != null && id != ""){
            loadDialogue(id);
        }

        if(state != null)
            state.add(_typeText);

        _typeText.resetText(currentMessage);
        _typeText.start(0.1, false, false, null, onComplete);
    }

    public function loadDialogue(id:String)
    {

        _messages = new Array<String>();

        _messages.push("Mensagem 1");
        _messages.push("Mensagem 2");
        _messages.push("Mensagem 3");

        _currentIndex = 0;
        loadedDialogueId = id;
        currentMessage = _messages[_currentIndex];
    }

    public function onComplete():Void
    {
        new FlxTimer().start(3, function(_){

            _currentIndex++;
            if(_currentIndex < _messages.length){
                currentMessage = _messages[_currentIndex];
            startDialogue();
            } else {
                _typeText.destroy();
            }

        });

    }

}