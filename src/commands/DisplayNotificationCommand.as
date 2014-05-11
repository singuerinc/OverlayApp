/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import com.greensock.TweenMax;
import com.greensock.easing.Expo;
import com.greensock.easing.Quad;

import flash.display.Sprite;

import org.as3commons.collections.SortedList;
import org.as3commons.collections.framework.IIterator;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import signals.DisplayNotificationSignal;

import views.ImageView;
import views.ui.NotificationView;

public class DisplayNotificationCommand extends Command {

  [Inject]
  public var signal:DisplayNotificationSignal;

  [Inject]
  public var mediatorMap:IMediatorMap;

  override public function execute():void {

    var text:String = signal.text;
    var icon:Sprite = signal.icon;
    var imageView:ImageView = signal.imageView;

    var notifications:SortedList = imageView.notifications; //FIXME: Put in model
    var notification:NotificationView = new NotificationView(text, icon);
    notifications.add(notification);
    imageView.notificationsContainer.addChild(notification);

    mediatorMap.mediate(notification);

    notification.x = 5;

    var i:IIterator = notifications.iterator() as IIterator;
    while (i.hasNext()) {
      var item:NotificationView = i.next();
      var idx:int = notifications.firstIndexOf(item);
      TweenMax.to(item, .4, {
        y: 5 + ((notifications.size - idx) * 25),
        ease: Quad.easeInOut
      });
    }

    TweenMax.from(notification, .4, {
      alpha: 0,
      ease: Quad.easeIn
    });

    TweenMax.delayedCall(3, _removeNotification, [notification, notifications]);
  }

  private function _removeNotification(notification:NotificationView, notifications:SortedList):void {

    TweenMax.to(notification, .6, {
      alpha: 0,
      ease: Expo.easeOut,
      "onComplete": function (notification:NotificationView, notifications:SortedList):void {
        notifications.remove(notification);
        notification.parent.removeChild(notification);
      },
      "onCompleteParams": [notification, notifications]
    });
  }
}
}