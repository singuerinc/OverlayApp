/**
 * Created by singuerinc on 09/05/2014.
 */
package views.buttons {
import flash.events.MouseEvent;

import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.AlwaysOnTopSignal;

import views.ImageView;

public class AlwaysOnTopActionBtnMediator extends Mediator {

  [Inject]
  public var view:AlwaysOnTopActionBtnView;

  [Inject]
  public var alwaysOnTopSignal:AlwaysOnTopSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function initialize():void {

    var imageView:ImageView = imageModelCollection.currentImage;
    var model:ImageModel = imageModelCollection.itemFor(imageView);

    view.state = model.alwaysOnTop ? 0 : 1;

    alwaysOnTopSignal.add(_onAlwaysOnTopSignal);
    view.addEventListener(MouseEvent.CLICK, _onClick);
  }

  private function _onAlwaysOnTopSignal(onTop:Boolean):void {
    view.state = onTop ? 0 : 1;
  }

  private function _onClick(event:MouseEvent):void {

    var imageView:ImageView = imageModelCollection.currentImage;
    var model:ImageModel = imageModelCollection.itemFor(imageView);

    alwaysOnTopSignal.dispatch(!model.alwaysOnTop);

  }
}
}
