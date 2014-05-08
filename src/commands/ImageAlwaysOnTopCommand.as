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

    var window:NativeWindow = ((event.data as ImageView).stage.nativeWindow) as NativeWindow;
    window.alwaysInFront = !window.alwaysInFront;
  }
}
}
