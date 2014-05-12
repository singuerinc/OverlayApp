/**
 * Created by singuerinc on 08/05/2014.
 */
package mediators {
import robotlegs.bender.bundles.mvcs.Mediator;

import signals.CreateImageViewSignal;
import signals.LoadImageViewSignal;

import views.MainFrameView;

public class MainFrameViewMediator extends Mediator {

  [Inject]
  public var view:MainFrameView;

  [Inject]
  public var createImageViewSignal:CreateImageViewSignal;
  [Inject]
  public var load:LoadImageViewSignal;

  override public function initialize():void {
    createImageViewSignal.dispatch();
    load.dispatch('file:///Users/singuerinc/Desktop/Screen Shot 2014-05-12 at 09.56.41.png');
  }

}
}
