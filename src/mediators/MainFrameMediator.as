/**
 * Created by singuerinc on 08/05/2014.
 */
package mediators {
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

import robotlegs.bender.bundles.mvcs.Mediator;

import views.MainFrameView;
import views.OverlayEvent;

public class MainFrameMediator extends Mediator {
  [Inject]
  public var view:MainFrameView;


  override public function initialize():void {

    super.initialize();

    // view.stage.nativeWindow.addEventListener(Event.ACTIVATE, _activateHandler, false, 0, true);
    // view.stage.nativeWindow.addEventListener(Event.DEACTIVATE, _deactivateHandler, false, 0, true);

    dispatch(new OverlayEvent(OverlayEvent.CREATE_IMAGE_VIEW));
  }

  /*
  protected function _activateHandler(event:Event):void {
    view.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown, false, 0, true);
  }

  protected function _deactivateHandler(event:Event):void {
    view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
  }

  private function _onKeyDown(event:KeyboardEvent):void {

    if (!event.controlKey && !event.altKey) {
      switch (event.keyCode) {
        case Keyboard.N:
          dispatch(new OverlayEvent(OverlayEvent.CREATE_IMAGE_VIEW));
          break;
      }
    }
  }
  */
}
}
