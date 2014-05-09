/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import flash.display.Sprite;

public class ShowHideActionBtnView extends Sprite {

  private var _state:uint;

  public function set state(value:uint):void {

    var w:int = 10;
    var h:int = 10;

    this._state = value;

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0xFF0000);
      graphics.drawRect(0, 0, w, h);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.4);
      graphics.drawRect(0, 0, w, h);
      graphics.endFill();
    }

  }
}
}
