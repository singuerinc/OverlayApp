/**
 * Created by singuerinc on 08/05/2014.
 */
package mediators {
import robotlegs.bender.bundles.mvcs.Mediator;

import signals.CreateImageViewSignal;

import views.MainFrameView;

public class MainFrameMediator extends Mediator {

  [Inject]
  public var view:MainFrameView;

  [Inject]
  public var createImageViewSignal:CreateImageViewSignal;

  override public function initialize():void {
    createImageViewSignal.dispatch();
  }

}
}
