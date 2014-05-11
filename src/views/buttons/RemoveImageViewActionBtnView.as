/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import org.osflash.signals.natives.base.SignalSprite;

public class RemoveImageViewActionBtnView extends SignalSprite {

  public function RemoveImageViewActionBtnView() {

    var w:int = 10;
    var h:int = 10;

    graphics.clear();
    graphics.beginFill(1, 0x000000);
    graphics.drawRect(0, 0, w, h);
    graphics.lineStyle(1, 0x00FF00);
    graphics.moveTo(0, 0);
    graphics.lineTo(w, h);
    graphics.moveTo(w, 0);
    graphics.lineTo(0, h);

  }
}
}
