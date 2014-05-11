/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IInjector;

import views.ImageView;

public class CreateImageViewCommand extends Command {

  [Inject]
  public var injector:IInjector;
  [Inject]
  public var mediatorMap:IMediatorMap;

  override public function execute():void {

    var view:ImageView = new ImageView();
    mediatorMap.mediate(view);

  }
}
}
