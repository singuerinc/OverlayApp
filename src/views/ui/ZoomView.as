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

  public static const W:uint = 150;
  public static const H:uint = 150;
  private var _zoom:uint = 6;

  public function ZoomView() {

    mouseEnabled = false;
    mouseChildren = false;

    bitmapData = new BitmapData(W, H, false, 0);
    var bitmap:Bitmap = new Bitmap(bitmapData);
    addChild(bitmap);

    var h:Sprite = new Sprite();
    h.blendMode = BlendMode.INVERT;
    h.y = H / 2;
    h.graphics.lineStyle(1, 0xFF6666, 0.9);
    h.graphics.lineTo(W, 0);
    addChild(h);

    var v:Sprite = new Sprite();
    v.blendMode = BlendMode.INVERT;
    v.x = W / 2;
    v.graphics.lineStyle(1, 0xFF6666, 0.9);
    v.graphics.lineTo(0, H);
    addChild(v);

    var border:Sprite = new Sprite();
    border.graphics.lineStyle(1, 0x666666, 1);
    border.graphics.drawRect(0, 0, W, H);
    addChild(border);
  }
  private var bitmapData:BitmapData;

  public function update(localX:Number, localY:Number, source:BitmapData):void {

    var m:Matrix = new Matrix();
    m.translate(-localX+((W/2)/zoom), -localY+((H/2)/zoom));
    m.scale(zoom, zoom);
    bitmapData.draw(source, m);
  }

  public function get zoom():uint {
    return _zoom;
  }

  public function set zoom(value:uint):void {
    _zoom = Math.min(10, Math.max(1, value));
  }
}
}
