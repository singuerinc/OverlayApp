/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

public class DropArea extends Sprite {

    private var text:TextField;

    public function DropArea() {

        super();

        alpha = 0.5;

        graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, 300, 300);
        graphics.endFill();

        text = new TextField();
        text.autoSize = TextFieldAutoSize.CENTER;
        text.textColor = 0xFFFFFF;
        text.text = 'Drop an image here.';

        text.x = (300 - text.textWidth) * 0.5;
        text.y = (300 - text.textHeight) * 0.5;

        addChild(text);

    }
}
}
