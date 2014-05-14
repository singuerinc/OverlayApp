/**
 * Created by singuerinc on 13/05/2014.
 */
package core {
import flash.desktop.NativeApplication;

public class Settings {

  public static const GA_ACCOUNT:String = 'UA-50962418-1';
  public static const UPDATER_URL:String = 'https://dl.dropboxusercontent.com/u/311265/overlay/build/latest/update.xml';

  public static function getAppVersion():String {
    var appXml:XML = NativeApplication.nativeApplication.applicationDescriptor;
    var ns:Namespace = appXml.namespace();
    var appVersion:String = appXml.ns::versionNumber[0];
    return appVersion;
  }

}
}
