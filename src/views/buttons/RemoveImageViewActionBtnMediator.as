/**
 * Created by singuerinc on 09/05/2014.
 */
package views.buttons {
import flash.events.MouseEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.RemoveImageViewSignal;

public class RemoveImageViewActionBtnMediator extends Mediator {

  [Inject]
  public var view:RemoveImageViewActionBtnView;

  [Inject]
  public var signal:RemoveImageViewSignal;

  override public function initialize():void {

    view.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {

      signal.dispatch();

    });
  }
}
}
