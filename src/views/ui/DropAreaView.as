/**
 * Created by singuerinc on 08/05/2014.
 */
package views.ui {
import core.Settings;

import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.GridFitType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import views.assets.Assets;

public class DropAreaView extends Sprite {

  public function DropAreaView() {

    super();

    dropOut();

    _tf = new TextField();
    _tf.embedFonts = true;
    _tf.alpha = 0.99;
    _tf.gridFitType = GridFitType.PIXEL;
    _tf.antiAliasType = AntiAliasType.ADVANCED;
    _tf.autoSize = TextFieldAutoSize.LEFT;
    _tf.wordWrap = true;
    _tf.multiline = true;
    _tf.width = W - 100;
    _tf.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0xFF0000, false);
    _tf.htmlText = 'Overlay ver. ' + Settings.getAppVersion();
    _tf.htmlText += 'Drop an image here.';
    _tf.htmlText += '<br/>';
    _tf.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0xBBBBBB, false);
    _tf.htmlText += '<br/>';
    _tf.htmlText += 'Shortcuts';
    _tf.htmlText += '<br/>';
    _tf.htmlText += 'Image';
    _tf.htmlText += '<br/>';
    _tf.htmlText += '0 to 9';
    _tf.htmlText += '+ & -';
    _tf.htmlText += 'I';
    _tf.htmlText += 'S or H';
    _tf.htmlText += 'X';
    _tf.htmlText += '<br/>';
    _tf.htmlText += 'Window';
    _tf.htmlText += '<br/>';
    _tf.htmlText += 'Arrows';
    _tf.htmlText += 'Shift + Arrows';
    _tf.htmlText += 'L';
    _tf.htmlText += '<br/>';
    _tf.htmlText += '<br/>';
    _tf.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0x666666, false);
    _tf.htmlText += 'Project:';
    _tf.htmlText += 'Bug reporting:';
    _tf.selectable = false;
    _tf.x = 50;
    _tf.y = (H - _tf.textHeight) * 0.5;

    _tf2 = new TextField();
    _tf2.embedFonts = true;
    _tf2.alpha = 0.99;
    _tf2.gridFitType = GridFitType.PIXEL;
    _tf2.antiAliasType = AntiAliasType.ADVANCED;
    _tf2.autoSize = TextFieldAutoSize.LEFT;
    _tf2.wordWrap = true;
    _tf2.multiline = true;
    _tf2.width = W - 100;
    _tf2.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0xBBBBBB, false);
    _tf2.htmlText = '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += 'Changes alpha ±10%';
    _tf2.htmlText += 'Changes alpha ±5%';
    _tf2.htmlText += 'Invert/Restore colors';
    _tf2.htmlText += 'Changes visibility';
    _tf2.htmlText += 'Remove';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += 'Changes position ±1px';
    _tf2.htmlText += 'Changes position ±10px';
    _tf2.htmlText += 'Lock/Unlock the window.';
    _tf2.htmlText += '<br/>';
    _tf2.htmlText += '<br/>';
    _tf2.defaultTextFormat = new TextFormat(Assets.FONT1, 8, 0x666666, false);
    _tf2.htmlText += '<a href="https://github.com/singuerinc/OverlayApp">https://github.com/singuerinc/OverlayApp</a>';
    _tf2.htmlText += '<a href="https://github.com/singuerinc/OverlayApp/issues">https://github.com/singuerinc/OverlayApp/issues</a>';
    _tf2.selectable = false;
    _tf2.x = 150;
    _tf2.y = (H - _tf2.textHeight) * 0.5;

    addChild(_tf);
    addChild(_tf2);

  }

  private var _tf:TextField;
  private var _tf2:TextField;
  private var W:int = 500;
  private var H:int = 500;

  public function dropIn():void {
    graphics.clear();
    graphics.beginFill(0x000000, 0.6);
    graphics.drawRect(0, 0, W, H);
    graphics.endFill();
  }

  public function dropOut():void {
    graphics.clear();
    graphics.beginFill(0x000000, 0.9);
    graphics.drawRect(0, 0, W, H);
    graphics.endFill();
  }
}
}
