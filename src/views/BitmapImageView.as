/**
 * Created by singuerinc on 10/05/2014.
 */
package views {
import flash.display.Bitmap;

import org.osflash.signals.natives.base.SignalSprite;

public class BitmapImageView extends SignalSprite {
  private var _bitmap:Bitmap;
  public function BitmapImageView(bitmap:Bitmap) {

    alpha = 0;
    visible = false;

    this.bitmap = bitmap;

    addChild(this.bitmap);
  }

  public function set bitmap(bitmap:Bitmap):void {
    _bitmap = bitmap;
  }

  public function get bitmap():Bitmap {
    return _bitmap;
  }
}
}
