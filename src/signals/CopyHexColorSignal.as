/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import flash.desktop.Clipboard;

import org.osflash.signals.Signal;

import views.ImageView;

public class CopyHexColorSignal extends Signal {

  public var imageView:ImageView;
  public var color:uint;

  public function CopyHexColorSignal() {
    super(ImageView, uint);
  }

  override public function dispatch(...valueObjects):void {
    this.imageView = valueObjects[0];
    this.color = valueObjects[1];
    super.dispatch.apply(this, valueObjects);
  }
}
}
