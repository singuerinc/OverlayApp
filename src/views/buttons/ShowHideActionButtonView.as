/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import views.OverlayEvent;

public class ShowHideActionButtonView extends ActionButtonView {
  public function ShowHideActionButtonView() {
    clickEventType = OverlayEvent.IMAGE_SHOW_HIDE;
    super();
  }


  override protected function updateState():void {

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0xFF0000);
      graphics.drawRect(0, 0, _w, _h);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.4);
      graphics.drawRect(0, 0, _w, _h);
      graphics.endFill();
    }

  }
}
}
