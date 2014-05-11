/**
 * Created by singuerinc on 10/05/2014.
 */
package views.ui {
import flash.display.Bitmap;

import org.osflash.signals.natives.base.SignalSprite;

public class BitmapImageView extends SignalSprite {
  private var _bitmap:Bitmap;
  private var _guides:GuidesView;
  public function BitmapImageView(bitmap:Bitmap) {

    _bitmap = bitmap;
    addChild(_bitmap);

    _guides = new GuidesView(this.bitmap.width, this.bitmap.height);
    addChild(_guides);
  }

  public function get bitmap():Bitmap {
    return _bitmap;
  }

  public function get guides():GuidesView {
    return _guides;
  }
}
}
