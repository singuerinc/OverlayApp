/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.Signal;

import views.ImageView;

public class ChangeAlphaSignal extends Signal {

  public var imageView:ImageView;
  public var alpha:Number;

  public function ChangeAlphaSignal() {
    super(ImageView, Number);
  }


  override public function dispatch(...valueObjects):void {
    this.imageView = valueObjects[0];
    this.alpha = valueObjects[1];
    super.dispatch.apply(this, valueObjects);
  }
}
}
