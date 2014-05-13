/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import com.google.analytics.GATracker;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.contextView.ContextView;

import services.AppUpdaterService;

import views.MainFrameView;

public class StartupCommand extends Command {

  [Inject]
  public var contextView:ContextView;

  [Inject]
  public var tracker:GATracker;
  [Inject]
  public var updaterService:AppUpdaterService;

  override public function execute():void {

    contextView.view.addChild(new MainFrameView());

//    tracker.trackEvent("Application", "Startup", Capabilities.os);
//    tracker.trackPageview("/");

    updaterService.updater.initialize();
  }
}
}