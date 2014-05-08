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

  public function DropArea(width:int, height:int) {

    super();

    alpha = 0.5;

    graphics.beginFill(0x000000);
    graphics.drawRect(0, 0, width, height);
    graphics.endFill();

    text = new TextField();
    text.antiAliasType = AntiAliasType.ADVANCED;
    text.autoSize = TextFieldAutoSize.CENTER;
    text.defaultTextFormat = new TextFormat('Roboto', 32, 0x777777);
    text.text = 'Drop an image here.';
    text.mouseEnabled = false;

    text.x = (width - text.textWidth) * 0.5;
    text.y = (height - text.textHeight) * 0.5;

    addChild(text);

  }
}
}
