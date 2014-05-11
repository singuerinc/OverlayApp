/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.AlwaysOnTopSignal;
import signals.DisplayNotificationSignal;

import views.ImageView;

public class ImageAlwaysOnTopCommand extends Command {

  [Inject]
  public var signal:AlwaysOnTopSignal;
  [Inject]
  public var notification:DisplayNotificationSignal;

  [Inject]
  public var imageModelCollection:ImagesMap;

  override public function execute():void {

    var view:ImageView = imageModelCollection.current;
    var model:ImageModel = imageModelCollection.itemFor(view);

    model.alwaysOnTop = signal.onTop;

    var window:NativeWindow = (view.stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = model.alwaysOnTop;

    notification.dispatch();
  }
}
}
