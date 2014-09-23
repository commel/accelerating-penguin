package;

import flash.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import entities.Penguin;

class Main extends Sprite {

  private var penguin:Penguin;
  private var keys = new Map<Int, Bool>();
  private var debugInfo:TextField = new TextField();
  
  private var inited = false;
  
	public function new () {
    super();
    
    addEventListener(Event.ADDED_TO_STAGE, added);
	}
  
  private function added(e) {
    removeEventListener(Event.ADDED_TO_STAGE, added);
    init();
  }  
  
  private function init() {
    if (inited) { 
      return; 
    }
      
    inited = true;
    
		penguin = new Penguin(stage.stageWidth, stage.stageHeight);
    
    var instructions:TextField = new TextField();
    instructions.selectable = false;
    instructions.text = "LEFT/RIGHT to accel/decel, SPACE to brake";
    instructions.textColor = 0xffffff;
    instructions.defaultTextFormat = new TextFormat("_sans", 12);
    instructions.x = 15;
    instructions.y = 370;
    instructions.width = 350;
    addChild(instructions);    

    this.addEventListener(Event.ENTER_FRAME, gameLoop);    
    
    addChild(penguin.getSprite());
    
    debugInfo.x = 450;
    debugInfo.y = 370;
    debugInfo.width = 300;
    
    addChild(debugInfo);    
    
    stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);    
  }
  
  private function gameLoop(e:Event) {
    if (keys[37]) {
      trace("left");
      penguin.boost("left");
    } 
    
    if (keys[39]) {
      trace("right");
      penguin.boost("right");
    }
      
    if (keys[32]) {
      trace("brake");
      penguin.brake();
    }
    
    penguin.update();
      
    var data = penguin.debug();
    debugInfo.text = '$data';
  }
  
  private function onKeyDown(evt: KeyboardEvent) {
    keys[evt.keyCode] = true;
  }
  
  private function onKeyUp(evt: KeyboardEvent) {
		keys[evt.keyCode] = false;
  }  
	
}