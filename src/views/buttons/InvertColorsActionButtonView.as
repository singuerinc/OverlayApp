/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
public class InvertColorsActionButtonView extends ActionButtonView {
  public function InvertColorsActionButtonView(text:String, color:uint, clickEventType:String) {
    super(text, color, clickEventType);
  }


  override protected function updateState():void {

    var c1:uint;
    var c2:uint;
    if (this._state == 0) {
      c1 = 0xFF0000;
      c2 = 0xFFFFFF;
    } else if (this._state == 1) {
      c1 = 0xFFFFFF;
      c2 = 0xFF0000;
    }

    graphics.clear();
    graphics.beginFill(c1);
    graphics.moveTo(0, 0);
    graphics.lineTo(_w, 0);
    graphics.lineTo(0, _h);
    graphics.lineTo(0, 0);
    graphics.beginFill(c2);
    graphics.moveTo(_w, 0);
    graphics.lineTo(0, _h);
    graphics.lineTo(_w, _h);
    graphics.lineTo(_w, 0);
    graphics.endFill();
  }
}
}
