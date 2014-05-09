/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import flash.display.Sprite;

public class AlwaysOnTopActionBtnView extends Sprite {

  public function AlwaysOnTopActionBtnView() {

  }

  protected var _w:int = 10;
  protected var _h:int = 10;
  protected var _state:uint;


  public function set state(value:uint):void {

    this._state = value;
    this._updateState();

  }

  public function get state():uint {
    return this._state;
  }

  private function _updateState():void {

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.4);
      graphics.drawRect(0, 0, _w, _h);
      graphics.beginFill(0xFF0000);
      graphics.drawRect(0, 0, _w, 2);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.4);
      graphics.drawRect(0, 0, _w, _h);
      graphics.beginFill(0xFF0000, 0.6);
      graphics.drawRect(0, _h - 2, _w, 2);
      graphics.endFill();
    }

  }
}
}
