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

    if (view.bmp) {

      var cm:ColorMatrix = new ColorMatrix();
      cm.invert();

      if (view.bmp.filters.length > 0) {
        view.bmp.filters = [];
        view.invertColorsActionBtn.state = 0;
      } else {
        view.bmp.filters = [cm.filter];
        view.invertColorsActionBtn.state = 1;
      }
    }

  }
}
}
