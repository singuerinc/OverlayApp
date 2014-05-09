/**
 * Created by singuerinc on 09/05/2014.
 */
package views.buttons {
import flash.events.MouseEvent;

import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.InvertColorsSignal;

import signals.LockOrUnlockSignal;

import views.ImageView;

public class InvertColorsActionBtnMediator extends Mediator {

  [Inject]
  public var view:InvertColorsActionBtnView;

  [Inject]
  public var signal:InvertColorsSignal;

  [Inject]
  public var imageModelCollection:ImageModelCollection;

  override public function initialize():void {

    var imageView:ImageView = imageModelCollection.currentImage;
    var model:ImageModel = imageModelCollection.itemFor(imageView);

    view.state = model.invertedColors ? 0 : 1;

    signal.add(_onSignal);
    view.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {

      signal.dispatch(!model.invertedColors);

    });
  }

  private function _onSignal(invertedColors:Boolean):void {
    view.state = invertedColors ? 0 : 1;
  }
}
}
