/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import signals.ChangeAlphaSignal;

import views.BitmapImageView;

public class ImageChangeAlphaCommand extends Command {

  [Inject]
  public var signal:ChangeAlphaSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function execute():void {

    var alpha:Number = signal.alpha;
    var bmp:BitmapImageView = signal.imageView.bmp;

    var model:ImageModel = imageModelCollection.itemFor(signal.imageView);

    model.alpha = alpha;
    bmp.alpha = model.alpha;

  }
}
}
