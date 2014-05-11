/**
 * Created by singuerinc on 10/05/2014.
 */
package signals {
import flash.display.Sprite;

import org.osflash.signals.Signal;

import views.ImageView;

public class DisplayNotificationSignal extends Signal {

  public function DisplayNotificationSignal() {
    super(ImageView, String, Sprite);
  }

  public var imageView:ImageView;
  public var text:String;
  public var icon:Sprite;

  override public function dispatch(...valueObjects):void {
    this.imageView = valueObjects[0];
    this.text = valueObjects[1];
    this.icon = valueObjects[2];
    super.dispatch.apply(this, valueObjects);
  }
}
}
