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

  protected var _w:int = 10;
  protected var _h:int = 10;
  protected var _state:uint;

  public function ActionButtonView() {
    state = 0;
  }

  protected function updateState():void {

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
