/**
 * Created by singuerinc on 10/05/2014.
 */
package mediators {
import flash.events.MouseEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.CopyHexColorSignal;

import views.BitmapImageView;
import views.ImageView;

public class BitmapImageViewMediator extends Mediator {

  [Inject]
  public var view:BitmapImageView;

  [Inject]
  public var signal:CopyHexColorSignal;

  override public function initialize():void {
    view.signals.click.add(_copyHexColor);
  }

  private function _copyHexColor(event:MouseEvent):void {

    if (event.commandKey) {

      var x:int = event.localX;
      var y:int = event.localY;
      var color:uint = view.bitmap.bitmapData.getPixel(x, y);
      signal.dispatch((view.parent as ImageView), color);
    }

  }
}
}
