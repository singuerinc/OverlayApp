/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import views.OverlayEvent;

public class AlwaysOnTopActionButtonView extends ActionButtonView {
  public function AlwaysOnTopActionButtonView() {
    clickEventType = OverlayEvent.IMAGE_ALWAYS_ON_TOP;
    super();
  }


  override protected function updateState():void {

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
      graphics.drawRect(0, _h-2, _w, 2);
      graphics.endFill();
    }

  }
}
}
