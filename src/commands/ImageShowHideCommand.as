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
  public var map:ImagesMap;

  [Inject]
  public var notification:DisplayNotificationSignal;

  override public function execute():void {

    var view:ImageView = map.current;
    var model:ImageModel = map.itemFor(view);
    model.visible = signal.visible;

    if (view.bmp) {

      view.bmp.visible = model.visible;
      view.dropArea.visible = false;

    } else {
      view.dropArea.visible = model.visible;
    }

    var icon:ShowHideActionBtnView = new ShowHideActionBtnView();
    icon.state = model.visible ? 0 : 1;
    notification.dispatch(model.visible ? 'Show' : 'Hide', icon);
  }
}
}
