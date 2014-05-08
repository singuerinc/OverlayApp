/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import views.ImageView;
import views.OverlayEvent;

public class CreateImageViewCommand extends Command {

  [Inject]
  public var event:OverlayEvent;
  [Inject]
  public var mediatorMap:IMediatorMap;

  override public function execute():void {

    mediatorMap.mediate(new ImageView())

  }
}
}
