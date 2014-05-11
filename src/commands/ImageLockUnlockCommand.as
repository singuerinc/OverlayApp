/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.DisplayNotificationSignal;

import signals.LockOrUnlockSignal;

import views.ImageView;
import views.buttons.LockUnlockActionBtnView;

public class ImageLockUnlockCommand extends Command {

  [Inject]
  public var signal:LockOrUnlockSignal;

  [Inject]
  public var model:ImagesMap;
  [Inject]
  public var notification:DisplayNotificationSignal;

  override public function execute():void {

    var view:ImageView = model.current;
    var model:ImageModel = model.itemFor(view);

    model.locked = signal.locked;

    var window:NativeWindow = (view.stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = model.locked;

    var valueTxt:String = model.locked ? 'locked' : 'unlocked';
    var icon:LockUnlockActionBtnView = new LockUnlockActionBtnView();
    icon.state = window.alwaysInFront ? 0 : 1;
    notification.dispatch('Window ' + valueTxt, icon);
  }
}
}
