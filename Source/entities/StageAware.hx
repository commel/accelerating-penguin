package entities;

class StageAware {
  private var stageWidth = 0;
  private var stageHeight = 0;
  
  public function new(stageWidth: Int, stageHeight: Int) {
    this.stageWidth = stageWidth - 200;
    this.stageHeight = stageHeight - 200;
  }
}