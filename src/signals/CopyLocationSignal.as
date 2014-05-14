/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import flash.geom.Rectangle;

import org.osflash.signals.Signal;

public class CopyLocationSignal extends Signal {

  public function CopyLocationSignal() {
    super(Rectangle);
  }

  public var rect:Rectangle;

  override public function dispatch(...valueObjects):void {
    this.rect = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
