/**
 * Created by singuerinc on 12/05/2014.
 */
package views.ui {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
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

    var hGuide:Sprite = new Sprite();
    hGuide.blendMode = BlendMode.INVERT;
    hGuide.y = H/2;
    hGuide.graphics.lineStyle(1, 0xFF6666, 0.9);
    hGuide.graphics.lineTo(W, 0);
    addChild(hGuide);

    var vGuide:Sprite = new Sprite();
    vGuide.blendMode = BlendMode.INVERT;
    vGuide.x = W/2;
    vGuide.graphics.lineStyle(1, 0xFF6666, 0.9);
    vGuide.graphics.lineTo(0, H);
    addChild(vGuide);

    var border:Sprite = new Sprite();
    border.graphics.lineStyle(1, 0x666666, 1);
    border.graphics.drawRect(0, 0, W, H);
    addChild(border);
  }

  private var bitmap:Bitmap;
  private var bitmapData:BitmapData;

//  public function update(source:BitmapData):void {
  public function update(localX:Number, localY:Number, source:BitmapData):void {

//    bitmap.x = localX - (W/2);
//    bitmap.y = localY - (H/2);

    var m:Matrix = new Matrix();
    m.translate(-localX+(50/ZOOM), -localY+(50/ZOOM));
    m.scale(ZOOM, ZOOM);
    bitmapData.draw(source, m);
  }
}
}
