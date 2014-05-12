/**
 * Created by singuerinc on 09/05/2014.
 */
package mediators {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.ChangeAlphaSignal;

import views.ImageView;

import views.ui.ImageAlphaDisplayView;

public class ImageAlphaDisplayViewMediator extends Mediator {

  [Inject]
  public var view:ImageAlphaDisplayView;

  [Inject]
  public var changeAlphaSignal:ChangeAlphaSignal;

  [Inject]
  public var model:ImagesMap;

  override public function initialize():void {
    changeAlphaSignal.addWithPriority(_onAlphaChanged, -1);
  }

  private function _onAlphaChanged(alpha:Number):void {

    var imageView:ImageView = model.current;
    var model:ImageModel = model.itemFor(imageView);

    var alpha:Number = model.alpha;
    view.update(alpha);
  }
}
}
