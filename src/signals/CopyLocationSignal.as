/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import flash.geom.Point;

import org.osflash.signals.Signal;

public class CopyLocationSignal extends Signal {

  public function CopyLocationSignal() {
    super(Point);
  }

  public var location:Point;

  override public function dispatch(...valueObjects):void {
    this.location = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
