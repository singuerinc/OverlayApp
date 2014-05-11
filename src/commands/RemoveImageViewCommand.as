/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import com.greensock.TweenMax;

import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import views.ImageView;

public class RemoveImageViewCommand extends Command {

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function execute():void {

    var view:ImageView = imageModelCollection.currentImage;


    try {
      view.bmp.parent.removeChild(view.bmp);
    } catch (e:Error) {

    }

    view.stage.stageWidth = 500;
    view.stage.stageHeight = 545;

    view.invertColorsActionBtn.visible = false;
    view.removeImageViewActionBtn.visible = false;

    TweenMax.to(view.dropArea, .4, {autoAlpha: 1});


  }
}
}