/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.geom.Point;

import robotlegs.bender.bundles.mvcs.Command;

import signals.CopyLocationSignal;
import signals.DisplayNotificationSignal;

import views.ui.PositionNotificationIcon;

public class CopyLocationCommand extends Command {

  [Inject]
  public var signal:CopyLocationSignal;
  [Inject]
  public var notificationSignal:DisplayNotificationSignal;

  override public function execute():void {

    var point:Point = signal.location;
    var text:String = 'top: ' + point.y + 'px;\nleft: ' + point.x + 'px;';
    Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, text);

    notificationSignal.dispatch('Location: x:' + point.x + ', y:' + point.y + ' copied to Clipboard', new PositionNotificationIcon());
  }
}
}