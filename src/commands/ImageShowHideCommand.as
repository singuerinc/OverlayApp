/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import signals.ShowHideSignal;

import views.ImageView;

public class ImageShowHideCommand extends Command {

  [Inject]
  public var signal:ShowHideSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function execute():void {

    var view:ImageView = imageModelCollection.currentImage;
    var model:ImageModel = imageModelCollection.itemFor(view);

    model.visible = signal.visible;

    view.bmpContainer.visible = model.visible;
    view.dropArea.visible = model.visible;
  }
}
}
