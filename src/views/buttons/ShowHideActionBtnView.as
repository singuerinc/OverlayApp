/**
 * Created by singuerinc on 08/05/2014.
 */
package views.buttons {
import flash.text.AntiAliasType;
import flash.text.GridFitType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import org.osflash.signals.natives.base.SignalSprite;

public class ShowHideActionBtnView extends SignalSprite {
  private var _textField:TextField;

  public function ShowHideActionBtnView() {

    _textField = new TextField();
    _textField.x = 0;
    _textField.y = 0;
    addChild(_textField);

    _textField.gridFitType = GridFitType.PIXEL;
    _textField.antiAliasType = AntiAliasType.ADVANCED;
    _textField.autoSize = TextFieldAutoSize.LEFT;
    _textField.defaultTextFormat = new TextFormat('Inconsolata', 8, 0xFFFFFF, false);

  }

  private var _state:uint;

  public function set state(value:uint):void {

    var w:int = 10;
    var h:int = 10;

    this._state = value;

    if (this._state == 0) {

      graphics.clear();
      graphics.beginFill(0xFF0000);
      graphics.drawRect(0, 0, w, h);
      graphics.endFill();

    } else if (this._state == 1) {

      graphics.clear();
      graphics.beginFill(0xFF0000, 0.4);
      graphics.drawRect(0, 0, w, h);
      graphics.endFill();
    }

  }

  public function updateAlpha(alpha:Number):void {
    _textField.text = Math.floor(alpha*100).toString();
  }
}
}
