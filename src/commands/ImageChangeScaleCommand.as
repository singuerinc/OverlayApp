/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.ChangeAlphaSignal;
import signals.ChangeScaleSignal;
import signals.DisplayNotificationSignal;

import views.ImageView;
import views.ui.BitmapImageView;

public class ImageChangeScaleCommand extends Command {

  [Inject]
  public var signal:ChangeScaleSignal;

  [Inject]
  public var model:ImagesMap;
  [Inject]
  public var notificationSignal:DisplayNotificationSignal;

  override public function execute():void {

    var view:ImageView = model.current;

    if (view) {

      var scale:Number = signal.scale;
      var bmp:BitmapImageView = view.bmp;

      var model:ImageModel = model.itemFor(view);

      model.scale = scale;
      bmp.bitmap.scaleX = bmp.bitmap.scaleY = model.scale;

      view.stage.stageWidth = view.bmp.width;
      view.stage.stageHeight = view.bmp.height + 45;

      notificationSignal.dispatch('Image scale: ' + model.scale, null);
    }

  }
}
}
