/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
public class LockUnlockActionButtonView extends ActionButtonView {
  public function LockUnlockActionButtonView(text:String, color:uint, clickEventType:String) {
    super(text, color, clickEventType);
  }


  override protected function updateState():void {

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.2);
      graphics.drawRect(0, 0, _w, _h);
      graphics.beginFill(0x000000);
      graphics.drawRect(2, 2, _w-2, _h-4);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0xFF0000);
      graphics.drawRect(0, 0, _w, _h);
      graphics.beginFill(0x000000);
      graphics.drawRect(2, 2, _w-4, _h-4);
      graphics.endFill();
    }

  }
}
}
