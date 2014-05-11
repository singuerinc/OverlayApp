/**
 * Created by singuerinc on 10/05/2014.
 */
package signals {
import flash.display.Sprite;

import org.osflash.signals.Signal;

public class DisplayNotificationSignal extends Signal {

  public function DisplayNotificationSignal() {
    super(String, Sprite);
  }

  public var text:String;
  public var icon:Sprite;

  override public function dispatch(...valueObjects):void {
    this.text = valueObjects[0];
    this.icon = valueObjects[1];
    super.dispatch.apply(this, valueObjects);
  }
}
}
