/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;

import robotlegs.bender.bundles.mvcs.Command;

import signals.CopyHexColorSignal;
import signals.DisplayNotificationSignal;

import views.ui.ColorNotificationIcon;

public class CopyHexColorCommand extends Command {

  [Inject]
  public var signal:CopyHexColorSignal;
  [Inject]
  public var notificationSignal:DisplayNotificationSignal;

  override public function execute():void {

    var hex:String = '000000' + signal.color.toString(16);
    hex = hex.substr(hex.length - 6);
    Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, hex);

    var color:uint = Number('0x' + hex);
    notificationSignal.dispatch('Color #' + hex + ' copied to Clipboard', new ColorNotificationIcon(color));
  }
}
}