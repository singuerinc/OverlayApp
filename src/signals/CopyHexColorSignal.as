/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.Signal;

public class CopyHexColorSignal extends Signal {

  public function CopyHexColorSignal() {
    super(uint);
  }

  public var color:uint;

  override public function dispatch(...valueObjects):void {
    this.color = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
