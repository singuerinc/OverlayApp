/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import signals.ChangeAlphaSignal;

import views.BitmapImageView;
import views.ImageView;

public class ImageChangeAlphaCommand extends Command {

  [Inject]
  public var signal:ChangeAlphaSignal;

  [Inject]
  public var model:ImageModelCollection;

  override public function execute():void {

    var imageView:ImageView = model.currentImage;

    var alpha:Number = signal.alpha;
    var bmp:BitmapImageView = imageView.bmp;

    var model:ImageModel = model.itemFor(imageView);

    model.alpha = alpha;
    bmp.alpha = model.alpha;

  }
}
}
