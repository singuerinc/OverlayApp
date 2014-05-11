/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.Signal;

public class LockOrUnlockSignal extends Signal {

  public var locked:Boolean;

  public function LockOrUnlockSignal() {
    super(Boolean);
  }

  override public function dispatch(...valueObjects):void {
    this.locked = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
