/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import flash.geom.Point;

import org.osflash.signals.PrioritySignal;

public class MoveWindowSignal extends PrioritySignal {

  public function MoveWindowSignal() {
    super(Point);
  }

  public var point:Point;

  override public function dispatch(...valueObjects):void {
    this.point = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
