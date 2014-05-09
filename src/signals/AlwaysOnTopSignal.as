/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.Signal;

public class AlwaysOnTopSignal extends Signal {

  public var onTop:Boolean;

  public function AlwaysOnTopSignal() {
    super(Boolean);
  }


  override public function dispatch(...valueObjects):void {
    this.onTop = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
