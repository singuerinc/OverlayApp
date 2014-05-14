/**
 * Created by singuerinc on 12/05/2014.
 */
package views.ui {
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.text.AntiAliasType;
import flash.text.GridFitType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import org.osflash.signals.natives.base.SignalSprite;

import views.assets.Assets;

public class GuidesView extends Sprite {

  private var _h:SignalSprite;
  private var _v:SignalSprite;
  private var _hTxt:TextField;
  private var _vTxt:TextField;

  public function GuidesView(w:uint, h:uint) {

    _h = new SignalSprite();
    _h.graphics.lineStyle(1, 0xFF0000, 1);
    _h.graphics.lineTo(w, 0);
    addChild(_h);

    _v = new SignalSprite();
    _v.graphics.lineStyle(1, 0xFF0000, 1);
    _v.graphics.lineTo(0, h);
    addChild(_v);

    _h.blendMode = BlendMode.INVERT;
    _v.blendMode = BlendMode.INVERT;

    _hTxt = txt();
    addChild(_hTxt);

    _vTxt = txt();
    addChild(_vTxt);
  }

  private function txt():TextField{
    var tf:TextField = new TextField();
    tf.width = 35;
    tf.height = 20;
    tf.background = true;
    tf.backgroundColor = 0x000000;
    tf.embedFonts = true;
    tf.gridFitType = GridFitType.PIXEL;
    tf.antiAliasType = AntiAliasType.ADVANCED;
    tf.autoSize = TextFieldAutoSize.NONE;
    tf.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0x00FF00, false, true, null, null, null, TextFormatAlign.CENTER);
    tf.selectable = false;
    tf.mouseEnabled = false;
    tf.alpha = 0.99;
    return tf;
  }

  public function update(rect:Rectangle):void {

    _h.visible = rect.y >= 0 && rect.y <= rect.height;
    _v.visible = rect.x >= 0 && rect.x <= rect.width;

    _hTxt.visible = _h.visible;
    _vTxt.visible = _v.visible;

    _h.y = Math.min(Math.max(0, rect.y), rect.height);
    _v.x = Math.min(Math.max(0, rect.x), rect.width);

    _hTxt.x = rect.x < 75 ? (rect.width-55) : 20;
    _hTxt.y = Math.min(Math.max(0, int(rect.y - 10)), rect.height-20);
    _hTxt.text = rect.y.toString();

    _vTxt.x = Math.min(Math.max(0, int(rect.x - 20)), rect.width-35);
    _vTxt.y = rect.y < 60 ? (rect.height-40) : 20;
    _vTxt.text = rect.x.toString();

  }
}
}
