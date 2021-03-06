package entities;

import flash.display.Bitmap;
import openfl.Assets;

class Penguin extends StageAware {
  private var bitmapData = Assets.getBitmapData("assets/Penguin.png");
	private var bitmap:Bitmap;
  
  public var jumping = false;
  private var acceleration = 0.9;
  private var speed = 0.0;
  private var maxSpeed = 10;
  
  public function new(stageWidth: Int, stageHeight: Int) {
    super(stageWidth, stageHeight);    
    bitmap = new Bitmap(bitmapData);
  }  
  
  public function getSprite():Bitmap {
    return bitmap;
  }
  
  public function update() {
    bitmap.x = bitmap.x + speed;
		checkBorders();
    checkSpeed();    
  }
  
  public function boost(target: String) {
		if (target == "left") {
      decel();
    } else if (target == "right") {
      accel();
    }
  }
   
  private function checkSpeed() {
    if (Math.abs(speed) > maxSpeed) {
      if (speed > 0) {
        speed = maxSpeed;
      } else {
        speed = -maxSpeed;
      }
    } 
  }
  
  public function brake() {
    speed = speed * -0.25;
    
    if (Math.abs(speed) <= 0.25) {
      speed = 0.0;
    }
  }
  
  private function accel() {
    speed = speed + ( acceleration * 1 );
    bitmap.x = bitmap.x + speed;
  }
  
  private function decel() {
    speed = speed + ( acceleration * -1 );
    bitmap.x = bitmap.x + speed;
  }
  
  private function checkBorders() {
    if (bitmap.x > stageWidth) {
      bitmap.x = stageWidth;
      speed = 0;
    } else if (bitmap.x < 0) {
      bitmap.x = 0;
      speed = 0;
    }    
  }
  
  public function debug() {
    return { speed: speed, x: bitmap.x, y: bitmap.y };
  }
}