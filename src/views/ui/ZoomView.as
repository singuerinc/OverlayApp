/**
 * Created by singuerinc on 12/05/2014.
 */
package views.ui {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.Matrix;

public class ZoomView extends Sprite {

  private const W:uint = 100;
  private const H:uint = 100;
  private const ZOOM:uint = 6;
  private const W2:uint = W/ZOOM;
  private const H2:uint = H/ZOOM;

  public function ZoomView() {

    mouseEnabled = false;
    mouseChildren = false;

    bitmapData = new BitmapData(W, H, false, 0);
    bitmap = new Bitmap(bitmapData);

    addChild(bitmap);

//    var msk:Sprite = new Sprite();
//    msk.graphics.beginFill(0);
//    msk.graphics.drawCircle(50, 50, 25);
//    msk.graphics.endFill();
//    msk.cacheAsBitmap = true;
//    addChild(msk);
//
//    bitmap.mask = msk;
  }

  private var bitmap:Bitmap;
  private var bitmapData:BitmapData;

  public function update(localX:Number, localY:Number, source:BitmapData):void {

    bitmap.x = localX - (W/2);
    bitmap.y = localY - (H/2);

    var m:Matrix = new Matrix();
    m.translate(-localX+(50/ZOOM), -localY+(50/ZOOM));
    m.scale(ZOOM, ZOOM);
    bitmapData.draw(source, m);
  }
}
}
