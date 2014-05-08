/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import views.OverlayEvent;

public class InvertColorsActionButtonView extends ActionButtonView {
  public function InvertColorsActionButtonView() {
    clickEventType = OverlayEvent.IMAGE_INVERT_COLORS;
    super();
  }

  override protected function updateState():void {

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0xFF0000);
      graphics.moveTo(0, 0);
      graphics.lineTo(_w, 0);
      graphics.lineTo(0, _h);
      graphics.lineTo(0, 0);
      graphics.beginFill(0xFF0000, 0.2);
      graphics.moveTo(_w, 0);
      graphics.lineTo(0, _h);
      graphics.lineTo(_w, _h);
      graphics.lineTo(_w, 0);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.2);
      graphics.moveTo(0, 0);
      graphics.lineTo(_w, 0);
      graphics.lineTo(0, _h);
      graphics.lineTo(0, 0);
      graphics.beginFill(0xFF0000);
      graphics.moveTo(_w, 0);
      graphics.lineTo(0, _h);
      graphics.lineTo(_w, _h);
      graphics.lineTo(_w, 0);
      graphics.endFill();
    }
  }
}
}
