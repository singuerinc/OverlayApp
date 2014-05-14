/**
 * Created by singuerinc on 10/05/2014.
 */
package views.ui {
import flash.display.Bitmap;

import org.osflash.signals.natives.base.SignalSprite;

public class BitmapImageView extends SignalSprite {
  private var _ruler:RulerView;
  public function BitmapImageView(bitmap:Bitmap) {

    _bitmap = bitmap;
    addChild(_bitmap);

    _zoom = new ZoomView();
    addChild(_zoom);

    _guides = new GuidesView(this.bitmap.width, this.bitmap.height);
    addChild(_guides);

    _ruler = new RulerView();
    addChild(_ruler);

  }

  private var _bitmap:Bitmap;

  public function get bitmap():Bitmap {
    return _bitmap;
  }

  private var _guides:GuidesView;

  public function get guides():GuidesView {
    return _guides;
  }

  private var _zoom:ZoomView;

  public function get zoom():ZoomView {
    return _zoom;
  }

  public function get ruler():RulerView {
    return _ruler;
  }
}
}
