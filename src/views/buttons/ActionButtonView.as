/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class ActionButtonView extends Sprite {

  public var clickEventType:String;
  public var label:TextField;
  public var text:String;
  public var color:uint;

  protected var _w:int = 10;
  protected var _h:int = 10;
  protected var _state:uint;

  public function ActionButtonView(text:String, color:uint, clickEventType:String) {

    this.text = text;
    this.color = color;
    this.clickEventType = clickEventType;

    state = 0;

    createUI();
  }

  protected function createUI():void {

//    label = new TextField();
//    label.antiAliasType = AntiAliasType.ADVANCED;
//    label.autoSize = TextFieldAutoSize.CENTER;
//    label.defaultTextFormat = new TextFormat('Roboto', 6, 0xBBBBBB);
//    label.text = this.text;
//    label.mouseEnabled = false;
//
//    label.x = (_w - label.textWidth) * 0.5;
//    label.y = (_h - label.textHeight) * 0.5;
//
//    addChild(label);

  }

  protected function updateState():void {

    var cc:uint;
    if (this._state == 0) {
      cc = this.color;
    } else if (this._state == 1) {
      cc = 0x444444;
    }

    graphics.clear();
    graphics.beginFill(cc);
    graphics.drawRect(0, 0, _w, _h);
    graphics.endFill();

  }

  public function set state(value:uint):void {

    this._state = value;
    this.updateState();

  }

  public function get state():uint {
    return this._state;
  }
}
}
