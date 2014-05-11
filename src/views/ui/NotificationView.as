/**
 * Created by singuerinc on 10/05/2014.
 */
package views.ui {
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.GridFitType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class NotificationView extends Sprite {

  private var _textField:TextField;
  private var _text:String;
  private var _icon:Sprite;

  public function NotificationView(text:String, icon:Sprite=null) {

    this._text = text;
    this._icon = icon;

    _textField = new TextField();
    _textField.x = 5;
    addChild(_textField);

    _textField.gridFitType = GridFitType.PIXEL;
    _textField.antiAliasType = AntiAliasType.ADVANCED;
    _textField.autoSize = TextFieldAutoSize.LEFT;
    _textField.defaultTextFormat = new TextFormat('Inconsolata', 14, 0x888888, false);
    _textField.text = _text;

    if (icon) {
      icon.x = 5;
      icon.y = 5;
      addChild(icon);
    }

    var w:int = _textField.width + 10;
    if (icon) {
      w += icon.width + 5;
      _textField.x = icon.x + icon.width + 5;
    }

    var h:int = 20;

    graphics.clear();
    graphics.beginFill(0x000000, 0.9);
    graphics.drawRect(0, 0, w, h);
    graphics.endFill();
  }
}
}
