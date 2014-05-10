/**
 * Created by singuerinc on 09/05/2014.
 */
package models {
import org.as3commons.collections.Map;

import views.ImageView;

public class ImageModelCollection extends Map {

  private var _currentImage:ImageView;

  override public function itemFor(key:*):* {

    var model:* = super.itemFor(key);

    if (model === undefined) {

      model = new ImageModel();
      add(key, model);

    }

    return model;
  }

  public function set currentImage(currentImage:ImageView):void {
    _currentImage = currentImage;
    trace('-------> _currentImage', currentImage);
  }

  public function get currentImage():ImageView {
    return _currentImage;
  }
}
}
