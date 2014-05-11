/**
 * Created by singuerinc on 09/05/2014.
 */
package models {
import org.as3commons.collections.Map;

import views.ImageView;

public class ImagesMap extends Map {

  private var _current:ImageView;

  public function get current():ImageView {
    return _current;
  }

  public function set current(currentImage:ImageView):void {
    _current = currentImage;
  }

  override public function itemFor(key:*):* {

    var model:* = super.itemFor(key);

    if (model === undefined) {

      model = new ImageModel();
      add(key, model);

    }

    return model;
  }
}
}
