/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.ShowHideSignal;

import views.ImageView;

public class ImageShowHideCommand extends Command {

  [Inject]
  public var signal:ShowHideSignal;

  [Inject]
  public var model:ImagesMap;

  override public function execute():void {

    var view:ImageView = model.current;
    var model:ImageModel = model.itemFor(view);

    model.visible = signal.visible;

    view.bmp.visible = model.visible;
    view.dropArea.visible = false;
  }
}
}
