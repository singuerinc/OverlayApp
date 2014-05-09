/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import flash.display.NativeWindow;

import org.osflash.signals.Signal;

public class AlwaysOnTopSignal extends Signal {

  public var nativeWindow:NativeWindow;
  public var value:Boolean;

  public function AlwaysOnTopSignal() {
    super(NativeWindow, Boolean);
  }


  override public function dispatch(...valueObjects):void {
    this.nativeWindow = valueObjects[0];
    this.value = valueObjects[1];
    super.dispatch.apply(this, valueObjects);
  }
}
}
