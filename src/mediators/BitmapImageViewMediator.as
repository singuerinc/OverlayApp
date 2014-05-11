/**
 * Created by singuerinc on 10/05/2014.
 */
package mediators {
import flash.events.MouseEvent;
import flash.geom.Point;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.CopyHexColorSignal;
import signals.CopyLocationSignal;

import views.BitmapImageView;

public class BitmapImageViewMediator extends Mediator {

  [Inject]
  public var view:BitmapImageView;

  [Inject]
  public var colorSignal:CopyHexColorSignal;
  [Inject]
  public var positionSignal:CopyLocationSignal;

  override public function initialize():void {
    view.signals.click.add(_onClick);
  }

  private function _onClick(event:MouseEvent):void {

    var x:int = event.localX;
    var y:int = event.localY;

    if (event.commandKey) {

      var color:uint = view.bitmap.bitmapData.getPixel(x, y);
      colorSignal.dispatch(color);

    } else if(event.altKey) {

      positionSignal.dispatch(new Point(x, y));

    }

  }
}
}
