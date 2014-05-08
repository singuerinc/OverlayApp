/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import robotlegs.bender.bundles.mvcs.Command;

import views.ImageView;
import views.OverlayEvent;

public class ImageInvertColorsCommand extends Command {

  [Inject]
  public var event:OverlayEvent;

  override public function execute():void {

    var view:ImageView = (event.data as ImageView);

    var cm:ColorMatrix = new ColorMatrix();
    cm.invert();

    view.bmp.filters = [cm.filter];

  }
}
}
