/**
 * Created by singuerinc on 10/05/2014.
 */
package mediators {
import com.greensock.TweenMax;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.ui.Keyboard;

import models.ImageModel;

import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.ChangeScaleSignal;

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
  [Inject]
  public var changeScaleSignal:ChangeScaleSignal;

  [Inject]
  public var map:ImagesMap;

  private var _model:ImageModel;


  private var _alt:Boolean;
  private var _guidesRect:Rectangle;
  private var _rulerRect:Rectangle;
  private var _mDown:Boolean;

  override public function initialize():void {

    _model = map.itemFor(map.current);

    _guidesRect = new Rectangle();
    _guidesRect.width = view.bitmap.width;
    _guidesRect.height = view.bitmap.height;

    _rulerRect = new Rectangle();

    view.ruler.visible = false;

    view.guides.visible = false;
    view.guides.alpha = 0;

    view.zoom.visible = false;

    view.signals.mouseDown.add(_onMouseDown);
    view.signals.mouseMove.add(_onMouseMove);
    view.signals.mouseUp.add(_onMouseUp);
    view.signals.enterFrame.add(_onEnterFrame);

    view.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
    view.stage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);

    changeScaleSignal.addWithPriority(_onScaleChanged, -2);
  }

  private function _onScaleChanged(scale:Number):void {
    view.zoom.x = view.bitmap.width + 5;
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

    if (_alt && (event.keyCode === Keyboard.NUMPAD_ADD)) {
      view.zoom.zoom++;
      view.zoom.update(view.mouseX, view.mouseY, view.bitmap.bitmapData);
    } else if (_alt && event.keyCode === Keyboard.NUMPAD_SUBTRACT) {
      view.zoom.zoom--;
      view.zoom.update(view.mouseX, view.mouseY, view.bitmap.bitmapData);
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

  private function _onMouseDown(event:MouseEvent):void {
    if (event.altKey) {

      _mDown = true;

      _rulerRect.x = view.mouseX;
      _rulerRect.y = view.mouseY;

      _rulerRect.width = 0;
      _rulerRect.height = 0;
    }
  }

  private function _onMouseMove(event:MouseEvent):void {
    if (_mDown && event.altKey) {

      var x:int = view.mouseX;
      var y:int = view.mouseY;

      var w:int = x - _rulerRect.x;
      var h:int = y - _rulerRect.y;

      _rulerRect.width = w;
      _rulerRect.height = h;

      view.ruler.update(_rulerRect);
      view.ruler.visible = true;

      event.updateAfterEvent();
    }
  }

  private function _onMouseUp(event:MouseEvent):void {

    if (event.altKey) {

      if (_rulerRect.width === 0 && _rulerRect.height === 0) {
//        positionSignal.dispatch(new Rectangle(_model.getScaled(view.mouseX), _model.getScaled(view.mouseY), 0, 0));
        positionSignal.dispatch(new Rectangle(view.mouseX, view.mouseY, 0, 0));
      } else {

        var x:int = _rulerRect.width < 0 ? _rulerRect.x + _rulerRect.width : _rulerRect.x;
        var y:int = _rulerRect.height < 0 ? _rulerRect.y + _rulerRect.height : _rulerRect.y;

        var w:int = Math.abs(_rulerRect.width);
        var h:int = Math.abs(_rulerRect.height);

//        var rect:Rectangle = new Rectangle(_model.getScaled(x), _model.getScaled(y), _model.getScaled(w), _model.getScaled(h));
        var rect:Rectangle = new Rectangle(x, y, w, h);

        positionSignal.dispatch(rect);
      }
    } else if (event.commandKey) {

      var color:uint = view.bitmap.bitmapData.getPixel(view.mouseX, view.mouseY);
      colorSignal.dispatch(color);
    }

    view.ruler.visible = false;
    _mDown = false;
  }
}
}
