/**
 * Created by singuerinc on 12/05/2014.
 */
package views.ui {
import flash.display.BlendMode;
import flash.display.Sprite;

import org.osflash.signals.natives.base.SignalSprite;

public class GuidesView extends Sprite {

  private var _hGuide:SignalSprite;
  private var _vGuide:SignalSprite;

  public function GuidesView(w:uint, h:uint) {

    blendMode = BlendMode.ADD;

    _hGuide = new SignalSprite();
    _hGuide.graphics.lineStyle(1, 0xFF0000, 1);
    _hGuide.graphics.lineTo(w, 0);
    addChild(_hGuide);

    _vGuide = new SignalSprite();
    _vGuide.graphics.lineStyle(1, 0xFF0000, 1);
    _vGuide.graphics.lineTo(0, h);
    addChild(_vGuide);
  }

  public function update(localX:Number, localY:Number):void {
    _hGuide.visible = localY > 0;
    _vGuide.visible = localX > 0;
    _hGuide.y = localY;
    _vGuide.x = localX;
  }
}
}
