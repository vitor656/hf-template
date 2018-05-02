package utils;

import flixel.addons.text.FlxTypeText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.FlxBasic;
import utils.ControlsManager;
import flixel.util.FlxColor;

/*

How to use it:

Declare a Dialogue variable in the Main State class and
instantiate it passing an new FlxTypeText as parameter.

Ex:
_dialogue = new Dialogue(new FlxTypeText(0, 0, 100, ""));
add(_dialogue);
_dialogue.startDialogue(this, "teste");

*/

// Add this manager to the current State to manage messages properly
class DialogueManager extends FlxBasic
{

    public inline static var DELAY_NORMAL:Float = 0.1;
    public inline static var DELAY_FAST:Float = 0.05;

    public inline static var BOX_OFFSET:Int = 5;

    public var _typeText : FlxTypeText;
    public var _messageBox : FlxSprite;
    private var _messages : Array<String>;
    private var _currentIndex : Int;
    private var currentMessage : String;
    private var loadedDialogueId : String;

    private var isComplete : Bool;
    
    public function new()
    {
        super();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if(_typeText != null){  
            if(isComplete){
                if(ControlsManager.justpPressedConfirm())
                    loadNextmessage();
            } else {
                if(ControlsManager.pressedConfirm())
                    _typeText.delay = DELAY_FAST;
                else
                    _typeText.delay = DELAY_NORMAL;
            }
        }
    }

    public function showMessage(messageReceiver:FlxTypeText)
    {
        
    }

    public function loadDialogueReceiver()
    {
        
        _typeText = new FlxTypeText(0, 0, Std.int(FlxG.width * 0.8) - (BOX_OFFSET * 2), "", 8, true);
        _typeText.skipKeys = [];
        _typeText.scrollFactor.set(0, 0);

    }

    public function startDialogue(?state:FlxState, ?id:String, ?onBox:Bool = true)
    {
        if(_typeText == null){
            loadDialogueReceiver();
        }

        if(id != null && id != ""){
            loadDialogue(id);
        }

        if(_typeText != null){

            if(onBox){
                _messageBox = new FlxSprite(0, 0);
                _messageBox.makeGraphic(Std.int(FlxG.width * 0.8), Std.int(FlxG.height * 0.3), FlxColor.BLACK);
                _messageBox.screenCenter();
                _messageBox.y = (FlxG.height - _messageBox.height) - 10;
                _messageBox.scrollFactor.set(0, 0);

                _typeText.x = _messageBox.x + BOX_OFFSET;
                _typeText.y = _messageBox.y + BOX_OFFSET;
                _typeText.width = _messageBox.width - (BOX_OFFSET * 2);

                state.add(_messageBox);
            }

            //Adiciona somente se carregou a lista de mensagens pela primeira vez
            if(_currentIndex == 0)
                state.add(_typeText);
           
            if(_messages != null && _messages.length > 0){
                isComplete = false;
                _typeText.resetText(currentMessage);
                _typeText.start(DELAY_NORMAL, false, false, onCompleteClick);
            } else {
                trace("No messages loaded...");
            }
        }
    }

    private function keepDialogueGoing()
    {
        if(_messages != null && _messages.length > 0){
            isComplete = false;
            _typeText.resetText(currentMessage);
            _typeText.start(DELAY_NORMAL, false, false, onCompleteClick);
        } else {
            trace("No messages loaded...");
        }
    }

    // Load messages from some kind of file maybe?
    public function loadDialogue(id:String)
    {
        _messages = new Array<String>();

        switch(id){
            case "teste":
                _messages.push("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas placerat lacus, sit amet bibendum velit. In hac habitasse platea dictumst. Fusce sed ultrices elit, non scelerisque mi.");
                _messages.push("Mensagem 2 Mensagem 2 Mensagem 2 Mensagem 2 Mensagem 2 Mensagem 2");
                _messages.push("Mensagem 3 Mensagem 3 Mensagem 3 Mensagem 3 Mensagem 3 Mensagem 3 Mensagem 3");
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
                keepDialogueGoing();
            } else {
                _typeText.destroy();
                if(_messageBox != null)
                    _messageBox.destroy();
            }
        }
    }

}