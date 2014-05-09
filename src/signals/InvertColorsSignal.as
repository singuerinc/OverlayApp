/**
 * Created by singuerinc on 09/05/2014.
 */
package signals {
import org.osflash.signals.Signal;

public class InvertColorsSignal extends Signal {

  public var invertedColors:Boolean;

  public function InvertColorsSignal() {
    super(Boolean);
  }


  override public function dispatch(...valueObjects):void {
    this.invertedColors = valueObjects[0];
    super.dispatch.apply(this, valueObjects);
  }
}
}
