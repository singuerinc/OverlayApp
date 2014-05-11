/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.AlwaysOnTopSignal;
import signals.DisplayNotificationSignal;

import views.ImageView;
import views.buttons.AlwaysOnTopActionBtnView;

public class ImageAlwaysOnTopCommand extends Command {

  [Inject]
  public var signal:AlwaysOnTopSignal;
  [Inject]
  public var notification:DisplayNotificationSignal;

  [Inject]
  public var imageModelCollection:ImagesMap;

  override public function execute():void {

    var view:ImageView = imageModelCollection.current;
    var model:ImageModel = imageModelCollection.itemFor(view);

    model.alwaysOnTop = signal.onTop;

    var window:NativeWindow = (view.stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = model.alwaysOnTop;

    var valueTxt:String = model.alwaysOnTop ? '' : ' off';
    var icon:AlwaysOnTopActionBtnView = new AlwaysOnTopActionBtnView();
    icon.state = window.alwaysInFront ? 0 : 1;
    notification.dispatch('Always on top' + valueTxt, icon);
  }
}
}
