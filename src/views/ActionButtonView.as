/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class ActionButtonView extends Sprite {

  public var clickEventType:String;
  public var label:TextField;
  public var color:uint;

  private var _w:int = 10;
  private var _h:int = 10;
  private var _state:uint;

  public function ActionButtonView(text:String, color:uint, clickEventType:String) {

    this.color = color;
    this.clickEventType = clickEventType;

    state = 0;

    label = new TextField();
    label.antiAliasType = AntiAliasType.ADVANCED;
    label.autoSize = TextFieldAutoSize.CENTER;
    label.defaultTextFormat = new TextFormat('Roboto', 6, 0xBBBBBB);
    label.text = text;
    label.mouseEnabled = false;

    label.x = (_w - label.textWidth) * 0.5;
    label.y = (_h - label.textHeight) * 0.5;

    addChild(label);

  }

  public function set state(value:uint):void {

    this._state = value;

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

  public function get state():uint {
    return this._state;
  }
}
}
