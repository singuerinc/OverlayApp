/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import com.greensock.TweenMax;

import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;

import signals.RemoveImageViewSignal;

import views.ImageView;

public class RemoveImageViewCommand extends Command {

  [Inject]
  public var signal:RemoveImageViewSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function execute():void {

    var view:ImageView = imageModelCollection.currentImage;

    if (view.bmp) {

      view.bmp.parent.removeChild(view.bmp);

      view.stage.stageWidth = 500;
      view.stage.stageHeight = 545;

      TweenMax.to(view.dropArea, .4, {autoAlpha: 1});
    }

  }
}
}