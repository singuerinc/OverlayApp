/**
 * Created by singuerinc on 08/05/2014.
 */
package mediators {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.desktop.NativeDragActions;
import flash.desktop.NativeDragManager;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.NativeDragEvent;
import flash.filesystem.File;
import flash.net.URLRequest;
import flash.ui.Keyboard;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import views.ImageView;
import views.OverlayEvent;

public class ImageViewMediator extends Mediator {

  [Inject]
  public var view:ImageView;

  [Inject]
  public var mediatorMap:IMediatorMap;

  override public function initialize():void {

    super.initialize();

    view.stage.nativeWindow.addEventListener(Event.ACTIVATE, _activateHandler, false, 0, true);
    view.stage.nativeWindow.addEventListener(Event.DEACTIVATE, _deactivateHandler, false, 0, true);

    view.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, _onDragIn);
    view.addEventListener(NativeDragEvent.NATIVE_DRAG_OVER, _onDragOver);
    view.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, _onDrop);
    view.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT, _onDragExit);

    view.moveActionBtn.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler, false, 0, true);

    mediatorMap.mediate(view.alwaysOnTopActionBtn);
    mediatorMap.mediate(view.invertColorsActionBtn);
    mediatorMap.mediate(view.showHideActionBtn);
  }

  protected function _activateHandler(event:Event):void {
    view.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown, false, 0, true);
  }

  protected function _deactivateHandler(event:Event):void {
    view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
  }

  protected function _mouseDownHandler(event:MouseEvent):void {
    view.stage.nativeWindow.startMove();
  }

  private function _onKeyDown(event:KeyboardEvent):void {

    if (event.controlKey && !event.altKey) {
      switch (event.keyCode) {
        case Keyboard.LEFT:
          view.stage.nativeWindow.x -= (event.shiftKey) ? 10.0 : 1.0;
          break;
        case Keyboard.RIGHT:
          view.stage.nativeWindow.x += (event.shiftKey) ? 10.0 : 1.0;
          break;
        case Keyboard.UP:
          view.stage.nativeWindow.y -= (event.shiftKey) ? 10.0 : 1.0;
          break;
        case Keyboard.DOWN:
          view.stage.nativeWindow.y += (event.shiftKey) ? 10.0 : 1.0;
          break;
      }
    }

    if (!event.controlKey && !event.altKey) {
      switch (event.keyCode) {
        case Keyboard.S:
        case Keyboard.H:
          dispatch(new OverlayEvent(OverlayEvent.IMAGE_SHOW_HIDE, view));
          break;
        case Keyboard.T:
          dispatch(new OverlayEvent(OverlayEvent.IMAGE_ALWAYS_ON_TOP, view));
          break;
        case Keyboard.T:
          dispatch(new OverlayEvent(OverlayEvent.IMAGE_INVERT_COLORS, view));
          break;
        case Keyboard.L:
          dispatch(new OverlayEvent(OverlayEvent.IMAGE_LOCK, view));
          break;
        case Keyboard.BACKSPACE:
        case Keyboard.D:
          if (view) {
            view.removeBitmap();
          }
          break;
        case Keyboard.NUMPAD_0:
        case Keyboard.NUMBER_0:
          view.alpha = 1;
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
          view.alpha = (event.keyCode - 48) * 0.1;
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
          view.alpha = (event.keyCode - 96) * 0.1;
          break;
        case Keyboard.NUMPAD_ADD:
          view.alpha += 0.1;
          view.alpha = Math.min(view.alpha, 1);
          break;
        case Keyboard.NUMPAD_SUBTRACT:
          view.alpha -= 0.1;
          view.alpha = Math.max(view.alpha, 0);
          break;
      }
    }
  }

  private function _onDragExit(event:NativeDragEvent):void {

  }

  private function _onDrop(event:NativeDragEvent):void {
    var clipboard:Clipboard = event.clipboard;
    if (clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)) {
      var dropFiles:Array = clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
      var imageFile:File = dropFiles[0];
      var loader:Loader = new Loader();
      var urlReq:URLRequest = new URLRequest(imageFile.url);
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onImageLoaded);
      loader.load(urlReq);
    }
  }

  private function _onImageLoaded(event:Event):void {
    view.setBitmap(event.target.content as Bitmap);
  }

  private function _onDragOver(event:NativeDragEvent):void {

  }

  private function _onDragIn(event:NativeDragEvent):void {

    var transferable:Clipboard = event.clipboard;
    if (transferable.hasFormat(ClipboardFormats.BITMAP_FORMAT) ||
        transferable.hasFormat(ClipboardFormats.FILE_LIST_FORMAT) ||
        transferable.hasFormat(ClipboardFormats.URL_FORMAT)
        ) {
      NativeDragManager.dropAction = NativeDragActions.MOVE;
      NativeDragManager.acceptDragDrop(view.dropArea);
    }
  }
}
}
