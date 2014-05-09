/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import signals.InvertColorsSignal;

import views.ImageView;

public class ImageInvertColorsCommand extends Command {

  [Inject]
  public var signal:InvertColorsSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function execute():void {

    var view:ImageView = imageModelCollection.currentImage;
    var model:ImageModel = imageModelCollection.itemFor(view);

    model.invertedColors = signal.invertedColors;

    if (view.bmp) {

      if (model.invertedColors) {

        var cm:ColorMatrix = new ColorMatrix();
        cm.invert();

        view.bmp.filters = [cm.filter];

      } else {

        view.bmp.filters = [];
      }
    }

  }
}
}
