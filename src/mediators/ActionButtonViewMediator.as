/**
 * Created by singuerinc on 08/05/2014.
 */
package mediators {
import flash.events.MouseEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import views.OverlayEvent;
import views.buttons.ActionButtonView;

public class ActionButtonViewMediator extends Mediator {

  [Inject]
  public var view:ActionButtonView;

  override public function initialize():void {
    view.addEventListener(MouseEvent.CLICK, _onClick);
  }

  private function _onClick(event:MouseEvent):void {
    dispatch(new OverlayEvent(view.clickEventType, view.parent.parent));
  }
}
}
