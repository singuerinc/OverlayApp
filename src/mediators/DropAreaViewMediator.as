/**
 * Created by singuerinc on 15/05/2014.
 */
package mediators {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.desktop.NativeDragActions;
import flash.desktop.NativeDragManager;
import flash.events.NativeDragEvent;
import flash.filesystem.File;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.LoadImageViewSignal;

import views.ui.DropAreaView;

public class DropAreaViewMediator extends Mediator {

  [Inject]
  public var loadImageViewSignal:LoadImageViewSignal;

  [Inject]
  public var view:DropAreaView;

  override public function initialize():void {

    view.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, _onDragIn);
    view.addEventListener(NativeDragEvent.NATIVE_DRAG_OVER, _onDragOver);
    view.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, _onDrop);
    view.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT, _onDragExit);
  }

  private function _onDragExit(event:NativeDragEvent):void {
    view.dropOut();
  }

  private function _onDrop(event:NativeDragEvent):void {
    var clipboard:Clipboard = event.clipboard;
    if (clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)) {
      var dropFiles:Array = clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
      var file:File = dropFiles[0];
      if ((file.extension === 'png') || (file.extension === 'jpg') || (file.extension === 'gif') || (file.extension === 'jpeg')) {
        loadImageViewSignal.dispatch(file);
      }
    }
  }

  private function _onDragOver(event:NativeDragEvent):void {
    view.dropIn();
  }

  private function _onDragIn(event:NativeDragEvent):void {
    var transferable:Clipboard = event.clipboard;
    if (transferable.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)) {
      NativeDragManager.dropAction = NativeDragActions.MOVE;
      NativeDragManager.acceptDragDrop(view);
    }
  }
}
}
