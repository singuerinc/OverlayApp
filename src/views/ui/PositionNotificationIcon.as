/**
 * Created by singuerinc on 11/05/2014.
 */
package views.ui {
import flash.display.Sprite;

public class PositionNotificationIcon extends Sprite {
  public function PositionNotificationIcon() {
    graphics.clear();
    graphics.beginFill(0x000000, 1);
    graphics.drawRect(0, 0, 10, 10);
    graphics.endFill();
    graphics.lineStyle(1, 0xFFFFFF);
    graphics.moveTo(1, 1);
    graphics.lineTo(9, 9);
    graphics.moveTo(9, 1);
    graphics.lineTo(1, 9);
    graphics.lineStyle(0, 0);
    graphics.beginFill(0xFF0000, 0.7);
    graphics.drawRect(2, 2, 5, 5);
    graphics.endFill();
  }
}
}
