/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.DisplayNotificationSignal;
import signals.ShowHideSignal;

import views.ImageView;
import views.buttons.ShowHideActionBtnView;

public class ImageShowHideCommand extends Command {

  [Inject]
  public var signal:ShowHideSignal;

  [Inject]
  public var model:ImagesMap;

  [Inject]
  public var notification:DisplayNotificationSignal;

  override public function execute():void {

    var view:ImageView = model.current;

    if (view && view.bmp) {

      var model:ImageModel = model.itemFor(view);

      model.visible = signal.visible;

      view.bmp.visible = model.visible;
      view.dropArea.visible = false;

      var valueTxt:String = model.visible ? 'Show' : 'Hide';
      var icon:ShowHideActionBtnView = new ShowHideActionBtnView();
      icon.state = model.visible ? 0 : 1;
      notification.dispatch(valueTxt, icon);

    }
  }
}
}
