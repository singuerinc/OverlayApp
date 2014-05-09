/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.Signal;

public class ShowHideSignal extends Signal {

  public var visible:Boolean;

  public function ShowHideSignal() {
    super(Boolean);
  }


  override public function dispatch(...valueObjects):void {
    this.visible = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
