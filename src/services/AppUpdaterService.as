/**
 * Created by singuerinc on 13/05/2014.
 */
package services {
import air.update.ApplicationUpdater;
import air.update.events.DownloadErrorEvent;
import air.update.events.UpdateEvent;

import com.google.analytics.GATracker;

import core.Settings;

import flash.events.ErrorEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.system.Capabilities;

import signals.DisplayNotificationSignal;

public class AppUpdaterService {

  public function AppUpdaterService() {

    updater = new ApplicationUpdater();
    updater.updateURL = Settings.UPDATER_URL;
    updater.addEventListener(UpdateEvent.INITIALIZED, _initialized);
    updater.addEventListener(ErrorEvent.ERROR, _errorHandler);
    updater.addEventListener(DownloadErrorEvent.DOWNLOAD_ERROR, _downloadErrorHandler);
  }

  [Inject]
  public var tracker:GATracker;

  [Inject]
  public var notification:DisplayNotificationSignal;

  public var updater:ApplicationUpdater;

  private function _initialized(event:UpdateEvent):void {

    var file:File = File.applicationStorageDirectory.resolvePath('overlay.json');
    var fileStream:FileStream = new FileStream();
    var json:Object;

    if (file.exists) {

      fileStream.open(file, FileMode.READ);
      json = JSON.parse(fileStream.readMultiByte(file.size, File.systemCharset));

    } else {

      fileStream.open(file, FileMode.WRITE);
      json = { "firstRun": false };
      var o:String = JSON.stringify(json);
      fileStream.writeMultiByte(o, File.systemCharset);

      tracker.trackEvent("Application", "Install", Capabilities.os);
    }

    if (updater.isFirstRun) {
      notification.dispatch("Overlay was successful updated to " + updater.currentVersion, null);
      tracker.trackEvent("Application", "Update", updater.previousVersion + " to " + updater.currentVersion);
    }

    notification.dispatch("Checking for updates...", null);
    updater.checkNow();
  }

  private function _errorHandler(event:ErrorEvent):void {
    trace(event);
  }

  private function _downloadErrorHandler(event:DownloadErrorEvent):void {
    trace(event);
  }
}
}
