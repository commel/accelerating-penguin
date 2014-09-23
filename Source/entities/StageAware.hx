package entities;

class StageAware {
  private var stageWidth = 0;
  private var stageHeight = 0;
  
  public function new(stageWidth: Int, stageHeight: Int) {
    this.stageWidth = stageWidth - 100;
    this.stageHeight = stageHeight - 100;
  }
}