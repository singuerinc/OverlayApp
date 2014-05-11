/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.LockOrUnlockSignal;

import views.ImageView;

public class ImageLockUnlockCommand extends Command {

  [Inject]
  public var signal:LockOrUnlockSignal;

  [Inject]
  public var model:ImagesMap;

  override public function execute():void {

    var view:ImageView = model.current;
    var model:ImageModel = model.itemFor(view);

    model.locked = signal.locked;

    var window:NativeWindow = (view.stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = model.locked;

  }
}
}
