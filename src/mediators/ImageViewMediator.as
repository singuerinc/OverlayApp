/**
 * Created by singuerinc on 08/05/2014.
 */
package mediators {
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.ui.Keyboard;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import signals.AlwaysOnTopSignal;
import signals.ChangeAlphaSignal;
import signals.ChangeScaleSignal;
import signals.InvertColorsSignal;
import signals.LockOrUnlockSignal;
import signals.MoveWindowSignal;
import signals.RemoveImageViewSignal;
import signals.ShowHideSignal;

import views.ImageView;

public class ImageViewMediator extends Mediator {

  [Inject]
  public var view:ImageView;
  [Inject]
  public var imageModelCollection:ImagesMap;

  [Inject]
  public var mediatorMap:IMediatorMap;

  [Inject]
  public var changeAlphaSignal:ChangeAlphaSignal;
  [Inject]
  public var changeScaleSignal:ChangeScaleSignal;
  [Inject]
  public var alwaysOnTopSignal:AlwaysOnTopSignal;
  [Inject]
  public var lockOrUnlockSignal:LockOrUnlockSignal;
  [Inject]
  public var showHideSignal:ShowHideSignal;
  [Inject]
  public var invertColorsSignal:InvertColorsSignal;
  [Inject]
  public var removeImageViewSignal:RemoveImageViewSignal;
  [Inject]
  public var moveWindowSignal:MoveWindowSignal;

  public var model:ImageModel;

  override public function initialize():void {

    super.initialize();

    model = imageModelCollection.itemFor(view);
    imageModelCollection.current = view;

    view.stage.nativeWindow.addEventListener(Event.ACTIVATE, _activateHandler, false, 0, true);
    view.stage.nativeWindow.addEventListener(Event.DEACTIVATE, _deactivateHandler, false, 0, true);

    view.signals.mouseDown.add(_mouseDownHandler);

    mediatorMap.mediate(view.dropArea);
    mediatorMap.mediate(view.alwaysOnTopActionBtn);
    mediatorMap.mediate(view.lockUnlockActionBtn);
    mediatorMap.mediate(view.invertColorsActionBtn);
    mediatorMap.mediate(view.showHideActionBtn);
    mediatorMap.mediate(view.removeImageViewActionBtn);
    mediatorMap.mediate(view.imageAlphaDisplayView);
    mediatorMap.mediate(view.scaleView);
  }

  protected function _activateHandler(event:Event):void {
    imageModelCollection.current = view;
    view.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown, false, 0, true);
  }

  protected function _deactivateHandler(event:Event):void {
    view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
  }

  protected function _mouseDownHandler(event:MouseEvent):void {

    if (model.locked || event.altKey || event.commandKey) return;

    view.stage.nativeWindow.startMove();
  }

  private function _onKeyDown(event:KeyboardEvent):void {

    if (!event.controlKey && !event.altKey) {
      switch (event.keyCode) {
        case Keyboard.NUMPAD_MULTIPLY:
          moveWindowSignal.dispatch(new Point(view.stage.nativeWindow.width * (model.moved ? 1 : -1), 0));
          model.moved = !model.moved;
          break;
        case Keyboard.LEFT:
          moveWindowSignal.dispatch(new Point((event.shiftKey) ? -10.0 : -1.0, 0));
          break;
        case Keyboard.RIGHT:
          moveWindowSignal.dispatch(new Point((event.shiftKey) ? 10.0 : 1.0, 0));
          break;
        case Keyboard.UP:
          moveWindowSignal.dispatch(new Point(0, (event.shiftKey) ? -10.0 : -1.0));
          break;
        case Keyboard.DOWN:
          moveWindowSignal.dispatch(new Point(0, (event.shiftKey) ? 10.0 : 1.0));
          break;
        case Keyboard.S:
        case Keyboard.H:
          showHideSignal.dispatch(!model.visible);
          break;
        case Keyboard.T:
          alwaysOnTopSignal.dispatch(!model.alwaysOnTop);
          break;
        case Keyboard.I:
          invertColorsSignal.dispatch(!model.invertedColors);
          break;
        case Keyboard.L:
          lockOrUnlockSignal.dispatch(!model.locked);
          break;
      }

      if (view.bmp) {
        switch (event.keyCode) {
          case Keyboard.BACKSPACE:
          case Keyboard.X:
            removeImageViewSignal.dispatch();
            break;
          case Keyboard.NUMPAD_0:
          case Keyboard.NUMBER_0:
            changeAlphaSignal.dispatch(1);
            break;
          case Keyboard.NUMBER_1:
          case Keyboard.NUMBER_2:
          case Keyboard.NUMBER_3:
          case Keyboard.NUMBER_4:
          case Keyboard.NUMBER_5:
          case Keyboard.NUMBER_6:
          case Keyboard.NUMBER_7:
          case Keyboard.NUMBER_8:
          case Keyboard.NUMBER_9:
            changeAlphaSignal.dispatch((event.keyCode - 48) * 0.1);
            break;
          case Keyboard.NUMPAD_1:
          case Keyboard.NUMPAD_2:
          case Keyboard.NUMPAD_3:
          case Keyboard.NUMPAD_4:
          case Keyboard.NUMPAD_5:
          case Keyboard.NUMPAD_6:
          case Keyboard.NUMPAD_7:
          case Keyboard.NUMPAD_8:
          case Keyboard.NUMPAD_9:
            changeAlphaSignal.dispatch((event.keyCode - 96) * 0.1);
            break;
          case Keyboard.NUMPAD_ADD:
            changeAlphaSignal.dispatch(model.alpha + 0.05);
            break;
          case Keyboard.NUMPAD_SUBTRACT:
            changeAlphaSignal.dispatch(model.alpha - 0.05);
            break;
          case Keyboard.Z:
            if (event.shiftKey) {
              changeScaleSignal.dispatch(model.scale - 0.25);
            } else {
              changeScaleSignal.dispatch(model.scale + 0.25);
            }
            break;
        }
      }
    }
  }
}
}
