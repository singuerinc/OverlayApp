/**
 * Created by singuerinc on 10/05/2014.
 */
package mediators {
import com.greensock.TweenMax;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

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

  private var _alt:Boolean;
  private var _guidesRect:Rectangle;

  override public function initialize():void {

    _guidesRect = new Rectangle();
    _guidesRect.width = view.bitmap.width;
    _guidesRect.height = view.bitmap.height;

    view.guides.visible = false;
    view.guides.alpha = 0;

    view.zoom.visible = false;
    view.zoom.x = view.bitmap.width-100;
    view.zoom.y = view.bitmap.height-100;

    view.signals.click.add(_onClick);
    view.signals.enterFrame.add(_onEnterFrame);
    view.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
    view.stage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);

  }

  private function _onKeyUp(event:KeyboardEvent):void {
    _alt = event.altKey;
    if (!_alt) {
      view.zoom.visible = false;
      TweenMax.to(view.guides, .5, {autoAlpha: 0});
    }
  }

  private function _onKeyDown(event:KeyboardEvent):void {
    _alt = event.altKey;
    if (_alt) {
      view.zoom.visible = true;
      TweenMax.to(view.guides, .5, {autoAlpha: 1});
    }
  }

  private function _onEnterFrame(event:Event):void {
    if (_alt) {
      _guidesRect.x = view.mouseX;
      _guidesRect.y = view.mouseY;
      view.guides.update(_guidesRect);
      view.zoom.update(view.mouseX, view.mouseY, view.bitmap.bitmapData);
    }
  }

  private function _onClick(event:MouseEvent):void {

    var x:int = view.mouseX;
    var y:int = view.mouseY;

    if (event.commandKey) {

      var color:uint = view.bitmap.bitmapData.getPixel(x, y);
      colorSignal.dispatch(color);

    } else if (event.altKey) {

      positionSignal.dispatch(new Point(x, y));

    }

  }
}
}
