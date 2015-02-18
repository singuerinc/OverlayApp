/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import views.ImageView;

public class RemoveImageViewCommand extends Command {

  [Inject]
  public var map:ImagesMap;

  override public function execute():void {

    var view:ImageView = map.current;
    var model:ImageModel = map.itemFor(view);

    try {
      view.bmp.parent.removeChild(view.bmp);
      view.bmp = null;
    } catch (e:Error) {
      trace(e);
    }

    view.stage.stageWidth = 500;
    view.stage.stageHeight = 545;

    view.invertColorsActionBtn.visible = false;
    view.removeImageViewActionBtn.visible = false;
    view.imageAlphaDisplayView.visible = false;
    view.scaleView.visible = false;

    view.dropArea.alpha = 1;
    view.dropArea.visible = true;

    model.visible = true;
    model.alpha = ImageModel.INIT_ALPHA;
    model.invertedColors = false;
    model.moved = false;
  }
}
}