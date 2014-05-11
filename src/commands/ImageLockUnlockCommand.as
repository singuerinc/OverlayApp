/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import signals.LockOrUnlockSignal;

import views.ImageView;

public class ImageLockUnlockCommand extends Command {

  [Inject]
  public var signal:LockOrUnlockSignal;

  [Inject]
  public var model:ImageModelCollection;

  override public function execute():void {

    var view:ImageView = model.currentImage;
    var model:ImageModel = model.itemFor(view);

    model.locked = signal.locked;

    var window:NativeWindow = (view.stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = model.locked;

  }
}
}
