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

import views.assets.Assets;

public class RulerView extends Sprite {

  public function RulerView() {

    _r = new Sprite();
    _r.graphics.beginFill(0x00FFFF, 0.3);
    _r.graphics.drawRect(0, 0, 100, 100);
    addChild(_r);

    _r.blendMode = BlendMode.DIFFERENCE;

    _txt = txt();
    addChild(_txt);
  }

  private var _r:Sprite;
  private var _txt:TextField;

  public function update(rect:Rectangle):void {

    var w:int = Math.abs(rect.width);
    var h:int = Math.abs(rect.height);

    _r.x = rect.width < 0 ? rect.x + rect.width : rect.x;
    _r.y = rect.height < 0 ? rect.y + rect.height : rect.y;
    _r.width = w;
    _r.height = h;

    _txt.x = _r.x;
    _txt.y = _r.y - 20;
    _txt.text = '' + w + 'x' + h + '';
  }

  private function txt():TextField {
    var tf:TextField = new TextField();
    tf.width = 60;
    tf.height = 20;
    tf.background = true;
    tf.backgroundColor = 0x000000;
    tf.embedFonts = true;
    tf.gridFitType = GridFitType.PIXEL;
    tf.antiAliasType = AntiAliasType.ADVANCED;
    tf.autoSize = TextFieldAutoSize.NONE;
    tf.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0x00FFFF, false, true, null, null, null, TextFormatAlign.CENTER);
    tf.selectable = false;
    tf.mouseEnabled = false;
    tf.alpha = 0.99;
    return tf;
  }
}
}
