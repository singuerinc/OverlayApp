/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.events.Event;

public class OverlayEvent extends Event {

  public static const CREATE_IMAGE_VIEW:String = 'createImageView';
  public static const IMAGE_ALWAYS_ON_TOP:String = 'imageAlwaysOnTop';
  public static const IMAGE_LOCK:String = 'imageLock';
  public static const IMAGE_SHOW_HIDE:String = 'imageShowHide';

  public var data:Object;

  public function OverlayEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
    super(type, bubbles, cancelable);
    this.data = data;
  }
}
}
