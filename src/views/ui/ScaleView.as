/**
 * Created by singuerinc on 08/05/2014.
 */
package views.ui {
import flash.text.AntiAliasType;
import flash.text.GridFitType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import org.osflash.signals.natives.base.SignalSprite;

import views.assets.Assets;

public class ScaleView extends SignalSprite {
  private var _textField:TextField;

  public function ScaleView() {

    _textField = new TextField();
    _textField.embedFonts = true;
    _textField.x = 0;
    _textField.y = -5;
    addChild(_textField);

    _textField.gridFitType = GridFitType.PIXEL;
    _textField.antiAliasType = AntiAliasType.ADVANCED;
    _textField.autoSize = TextFieldAutoSize.LEFT;
    _textField.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0x00FF00, false, true);
    _textField.selectable = false;
    _textField.mouseEnabled = false;
    _textField.alpha = 0.99;

  }

  public function update(scale:Number):void {
    _textField.text = 'x' + scale.toString();
  }
}
}
