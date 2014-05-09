/**
 * Created by singuerinc on 09/05/2014.
 */
package models {
import org.as3commons.collections.Map;

public class ImageModelCollection extends Map {

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
