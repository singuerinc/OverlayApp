/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import flash.display.Sprite;

public class RemoveImageViewActionBtnView extends Sprite {


  public function RemoveImageViewActionBtnView() {

    var w:int = 10;
    var h:int = 10;

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

  }
}
}
