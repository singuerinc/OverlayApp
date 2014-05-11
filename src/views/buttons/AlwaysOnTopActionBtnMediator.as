/**
 * Created by singuerinc on 09/05/2014.
 */
package views.buttons {
import flash.events.MouseEvent;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.AlwaysOnTopSignal;

import views.ImageView;

public class AlwaysOnTopActionBtnMediator extends Mediator {

  [Inject]
  public var view:AlwaysOnTopActionBtnView;

  [Inject]
  public var alwaysOnTopSignal:AlwaysOnTopSignal;

  [Inject]
  public var imageModelCollection:ImagesMap;

  override public function initialize():void {

    var imageView:ImageView = imageModelCollection.current;
    var model:ImageModel = imageModelCollection.itemFor(imageView);

    view.state = model.alwaysOnTop ? 0 : 1;

    alwaysOnTopSignal.add(_onAlwaysOnTopSignal);
    view.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {

      alwaysOnTopSignal.dispatch(!model.alwaysOnTop);

    });
  }

  private function _onAlwaysOnTopSignal(onTop:Boolean):void {
    view.state = onTop ? 0 : 1;
  }

}
}
