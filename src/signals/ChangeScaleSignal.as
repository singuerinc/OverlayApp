/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.PrioritySignal;

public class ChangeScaleSignal extends PrioritySignal {

  public function ChangeScaleSignal() {
    super(Number);
  }

  public var scale:Number;

  override public function dispatch(...valueObjects):void {
    this.scale = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
