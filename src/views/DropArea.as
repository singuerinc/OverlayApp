/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class DropArea extends Sprite {

  private var text:TextField;

  private var W:int = 500;
  private var H:int = 500;

  public function DropArea() {

    super();

    dropOut();

    text = new TextField();
    text.antiAliasType = AntiAliasType.ADVANCED;
    text.autoSize = TextFieldAutoSize.LEFT;
    text.wordWrap = true;
    text.multiline = true;
    text.width = W - 100;
    text.defaultTextFormat = new TextFormat('Envy Code R VS', 14, 0x999999);
    text.htmlText = 'Drop an image here.';
    text.defaultTextFormat = new TextFormat('Envy Code R VS', 11, 0x666666);
    text.htmlText +='<br/>';
    text.htmlText +='0 to 9  · Changes image alpha.';
    text.htmlText +='+ and - · Changes image alpha.';
    text.htmlText +='I       · Invert image colours.';
    text.htmlText +='D       · Remove the image.';
    text.htmlText +='<br/>';
    text.htmlText +='Arrows  · Changes window position +=1px';
    text.htmlText +='          with "Shift" +=10px';
    text.htmlText +='<br/>';
    text.htmlText +='L       · Lock/Unlock the window.';
    text.htmlText +='S or H  · Changes window visibility.';

    text.mouseEnabled = false;

    text.x = 50;
    text.y = (H - text.textHeight) * 0.5;

    addChild(text);

  }

  public function dropIn():void {
    graphics.clear();
    graphics.beginFill(0x000000, 0.6);
    graphics.drawRect(0, 0, W, H);
    graphics.endFill();
  }

  public function dropOut():void {
    graphics.clear();
    graphics.beginFill(0x000000, 0.8);
    graphics.drawRect(0, 0, W, H);
    graphics.endFill();
  }
}
}
