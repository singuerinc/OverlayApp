/**
 * Created by singuerinc on 12/05/2014.
 */
package mediators {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.ChangeScaleSignal;

import views.ImageView;
import views.ui.GuidesView;

public class GuidesViewMediator extends Mediator {

  [Inject]
  public var view:GuidesView;

  [Inject]
  public var changeScaleSignal:ChangeScaleSignal;

  [Inject]
  public var map:ImagesMap;

  override public function initialize():void {

    view.mouseEnabled = false;
    view.mouseChildren = false;

    changeScaleSignal.addWithPriority(_onScaleChanged, -2);
  }

  private function _onScaleChanged(scale:Number):void {
    var imageView:ImageView = map.current;
    var model:ImageModel = map.itemFor(imageView);
    view.drawGuides(imageView.bmp.bitmap.width, imageView.bmp.bitmap.height);
  }

}
}
