/**
 * Created by singuerinc on 12/05/2014.
 */
package mediators {
import robotlegs.bender.bundles.mvcs.Mediator;

import views.ui.GuidesView;

public class GuidesViewMediator extends Mediator {

  [Inject]
  public var view:GuidesView;

  override public function initialize():void {

    view.mouseEnabled = false;
    view.mouseChildren = false;

  }
}
}
