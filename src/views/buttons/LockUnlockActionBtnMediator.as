/**
 * Created by singuerinc on 09/05/2014.
 */
package views.buttons {
import flash.events.MouseEvent;

import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.LockOrUnlockSignal;

import views.ImageView;

public class LockUnlockActionBtnMediator extends Mediator {

  [Inject]
  public var view:LockUnlockActionBtnView;

  [Inject]
  public var lockSignal:LockOrUnlockSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function initialize():void {

    var imageView:ImageView = imageModelCollection.currentImage;
    var model:ImageModel = imageModelCollection.itemFor(imageView);

    view.state = model.locked ? 0 : 1;

    lockSignal.add(_onLockOrUnlockSignal);
    view.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {

      lockSignal.dispatch(!model.locked);

    });
  }

  private function _onLockOrUnlockSignal(locked:Boolean):void {
    view.state = locked ? 0 : 1;
  }
}
}
