/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.events.Event;

public class OverlayEvent extends Event {

  public static const CREATE_IMAGE_VIEW:String = 'createImageView';

  public function OverlayEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
    super(type, bubbles, cancelable);
  }
}
}
