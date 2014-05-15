/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import com.google.analytics.GATracker;

import flash.filesystem.File;

import flash.system.Capabilities;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.contextView.ContextView;

import services.AppUpdaterService;

import signals.CreateImageViewSignal;
import signals.LoadImageViewSignal;

import views.MainFrameView;

public class StartupCommand extends Command {

  [Inject]
  public var contextView:ContextView;

  [Inject]
  public var tracker:GATracker;
  [Inject]
  public var updaterService:AppUpdaterService;
  [Inject]
  public var createImageViewSignal:CreateImageViewSignal;
  [Inject]
  public var load:LoadImageViewSignal;

  override public function execute():void {

    contextView.view.addChild(new MainFrameView());
    createImageViewSignal.dispatch();

    tracker.trackEvent("Application", "Startup", Capabilities.serverString);
    tracker.trackPageview("/");

    updaterService.updater.initialize();

    //load.dispatch(new File().resolvePath('/Users/singuerinc/Desktop/overlay/chrome_welcome.png'));
  }
}
}