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
import views.ui.ZoomView;

public class ImageChangeScaleCommand extends Command {

  [Inject]
  public var signal:ChangeScaleSignal;

  [Inject]
  public var map:ImagesMap;
  [Inject]
  public var notificationSignal:DisplayNotificationSignal;

  override public function execute():void {

    var view:ImageView = map.current;

    if (view) {

      var scale:Number = signal.scale;
      var bmp:BitmapImageView = view.bmp;

      var model:ImageModel = map.itemFor(view);

      model.scale = scale;
      bmp.bitmap.scaleX = bmp.bitmap.scaleY = model.scale;

      view.stage.stageWidth = model.getScaled(view.bmp.width) + ZoomView.W;
      view.stage.stageHeight = model.getScaled(view.bmp.height) + 45;

      notificationSignal.dispatch('Image scale: x' + model.scale.toFixed(2), null);
    }

  }
}
}
