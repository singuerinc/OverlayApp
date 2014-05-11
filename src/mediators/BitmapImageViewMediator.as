/**
 * Created by singuerinc on 10/05/2014.
 */
package mediators {
import com.greensock.TweenMax;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Point;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.CopyHexColorSignal;
import signals.CopyLocationSignal;

import views.ui.BitmapImageView;

public class BitmapImageViewMediator extends Mediator {

  [Inject]
  public var view:BitmapImageView;

  [Inject]
  public var colorSignal:CopyHexColorSignal;
  [Inject]
  public var positionSignal:CopyLocationSignal;
  private var _over:Boolean;
  private var _alt:Boolean;

  override public function initialize():void {
    view.guides.alpha = 0;
    view.signals.click.add(_onClick);
    view.signals.enterFrame.add(_onEnterFrame);
    view.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
    view.stage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
  }

  private function _onKeyUp(event:KeyboardEvent):void {
    _alt = event.altKey;
    if (!_alt) {
      TweenMax.to(view.guides, .5, {alpha: 0});
    }
  }

  private function _onKeyDown(event:KeyboardEvent):void {
    _alt = event.altKey;
    if (_alt) {
      TweenMax.to(view.guides, .5, {alpha: 1});
    }
  }

  private function _onEnterFrame(event:Event):void {
    if (_alt) {
      view.guides.update(view.mouseX, view.mouseY);
    }
  }

  private function _onClick(event:MouseEvent):void {

    var x:int = event.localX;
    var y:int = event.localY;

    if (event.commandKey) {

      var color:uint = view.bitmap.bitmapData.getPixel(x, y);
      colorSignal.dispatch(color);

    } else if (event.altKey) {

      positionSignal.dispatch(new Point(x, y));

    }

  }
}
}
