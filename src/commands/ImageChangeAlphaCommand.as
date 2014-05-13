/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.ChangeAlphaSignal;

import views.ImageView;
import views.ui.BitmapImageView;

public class ImageChangeAlphaCommand extends Command {

  [Inject]
  public var signal:ChangeAlphaSignal;

  [Inject]
  public var model:ImagesMap;

  override public function execute():void {

    var view:ImageView = model.current;

    if (view) {

      var alpha:Number = signal.alpha;
      var bmp:BitmapImageView = view.bmp;

      var model:ImageModel = model.itemFor(view);

      model.alpha = Math.max(0, Math.min(alpha, 1));
      bmp.alpha = model.alpha;

    }

  }
}
}
