/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import robotlegs.bender.bundles.mvcs.Command;

import views.ImageView;
import views.OverlayEvent;

public class ImageAlwaysOnTopCommand extends Command {

  [Inject]
  public var event:OverlayEvent;

  override public function execute():void {

    var view:ImageView = (event.data as ImageView);

    var window:NativeWindow = (view.stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = !window.alwaysInFront;

    view.alwaysOnTopActionBtn.state = window.alwaysInFront ? 0 : 1;
  }
}
}
