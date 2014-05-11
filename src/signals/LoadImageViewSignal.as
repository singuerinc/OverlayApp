/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {

import org.osflash.signals.Signal;

public class LoadImageViewSignal extends Signal {

  public var url:String;

  public function LoadImageViewSignal() {
    super(String);
  }


  override public function dispatch(...valueObjects):void {
    this.url = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
