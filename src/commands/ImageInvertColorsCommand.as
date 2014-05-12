/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.DisplayNotificationSignal;

import signals.InvertColorsSignal;

import views.ImageView;
import views.buttons.InvertColorsActionBtnView;

public class ImageInvertColorsCommand extends Command {

  [Inject]
  public var signal:InvertColorsSignal;

  [Inject]
  public var model:ImagesMap;

  [Inject]
  public var notification:DisplayNotificationSignal;

  override public function execute():void {

    var view:ImageView = model.current;
    var model:ImageModel = model.itemFor(view);

    model.invertedColors = signal.invertedColors;

    if (view.bmp) {

      if (model.invertedColors) {

        var cm:ColorMatrix = new ColorMatrix();
        cm.invert();

        view.bmp.filters = [cm.filter];

      } else {
        view.bmp.filters = [];
      }

      var valueTxt:String = model.invertedColors ? 'Inverted colors' : 'Original colors';
      var icon:InvertColorsActionBtnView = new InvertColorsActionBtnView();
      icon.state = model.invertedColors ? 0 : 1;
      notification.dispatch(valueTxt, icon);

    }

  }
}
}
