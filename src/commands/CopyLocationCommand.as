/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.geom.Rectangle;

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

    var rect:Rectangle = signal.rect;

    var clipboardStr:String;
    var notificationStr:String;

    if (rect.width === 0 && rect.height === 0) {
      clipboardStr = 'top: ' + rect.y + 'px;\nleft: ' + rect.x + 'px;';
      notificationStr = 'Location: x:' + rect.x + ', y:' + rect.y + ' copied to Clipboard';
    } else {
      clipboardStr = 'top: ' + rect.y + 'px;\nleft: ' + rect.x + 'px;\nwidth: ' + rect.width + 'px;\nheight: ' + rect.height + 'px;';
      notificationStr = 'Dimensions: x:' + rect.x + ', y:' + rect.y + ', w:' + rect.width + ', h:' + rect.height + ' copied to Clipboard';
    }

    notificationSignal.dispatch(notificationStr, new PositionNotificationIcon());

    Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, clipboardStr);
  }
}
}