/**
 * Created by singuerinc on 11/05/2014.
 */
package views.ui {
import flash.display.Sprite;

public class ColorNotificationIcon extends Sprite {
  public function ColorNotificationIcon(color:uint) {
    graphics.clear();
    graphics.beginFill(color, 1);
    graphics.drawRect(0, 0, 10, 10);
    graphics.endFill();
  }
}
}
