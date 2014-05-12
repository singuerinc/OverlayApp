/**
 * Created by singuerinc on 09/05/2014.
 */
package views.buttons {
import flash.events.MouseEvent;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.ShowHideSignal;

import views.ImageView;

public class ShowHideActionBtnMediator extends Mediator {

  [Inject]
  public var view:ShowHideActionBtnView;

  [Inject]
  public var showHideSignal:ShowHideSignal;

  [Inject]
  public var imageModelCollection:ImagesMap;

  override public function initialize():void {

    var imageView:ImageView = imageModelCollection.current;
    var model:ImageModel = imageModelCollection.itemFor(imageView);

    view.state = model.visible ? 0 : 1;

    showHideSignal.add(_onShowHideSignal);

    view.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
      showHideSignal.dispatch(!model.visible);
    });

  }

  private function _onShowHideSignal(visible:Boolean):void {
    view.state = visible ? 0 : 1;
  }
}
}
