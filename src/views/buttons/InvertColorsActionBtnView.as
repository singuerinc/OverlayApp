/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import flash.display.Sprite;

public class InvertColorsActionBtnView extends Sprite {


  private var _state:uint;

  public function set state(value:uint):void {

    var w:int = 10;
    var h:int = 10;

    this._state = value;

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0x00FF00);
      graphics.moveTo(0, 0);
      graphics.lineTo(w, 0);
      graphics.lineTo(0, h);
      graphics.lineTo(0, 0);
      graphics.beginFill(0x00FF00, 0.4);
      graphics.moveTo(w, 0);
      graphics.lineTo(0, h);
      graphics.lineTo(w, h);
      graphics.lineTo(w, 0);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0x00FF00, 0.4);
      graphics.moveTo(0, 0);
      graphics.lineTo(w, 0);
      graphics.lineTo(0, h);
      graphics.lineTo(0, 0);
      graphics.beginFill(0x00FF00);
      graphics.moveTo(w, 0);
      graphics.lineTo(0, h);
      graphics.lineTo(w, h);
      graphics.lineTo(w, 0);
      graphics.endFill();
    }
  }
}
}
