/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {

import flash.filesystem.File;

import org.osflash.signals.Signal;

public class LoadImageViewSignal extends Signal {

  public function LoadImageViewSignal() {
    super(File);
  }

  public var file:File;

  override public function dispatch(...valueObjects):void {
    this.file = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
